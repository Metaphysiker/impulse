class AddSearchFieldGenerator < Rails::Generators::NamedBase
  #source_root File.expand_path('templates', __dir__)
  def add_search_field_to_model
    run "rails g migration AddSearchFieldTo#{plural_table_name.capitalize} search_field:text"
    run "rails db:migrate"
  end

  def  add_update_search_field
    inject_into_file "app/models/#{singular_table_name}.rb", after: "class #{singular_table_name.capitalize} < ApplicationRecord\n" do <<-FILE
before_save :update_search_field
scope :#{plural_table_name}_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

def update_search_field
  self.search_field =
[
 ""
].compact.join(' ')
end
FILE
    end
  end

  def add_search_class
    create_file "app/models/#{singular_table_name}_search.rb" do <<-FILE
class #{singular_table_name.capitalize}Search
  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
  end

  def search
    query = #{singular_table_name.capitalize}.all

    unless @search_term.nil? || @search_term.blank?
      query = query.#{plural_table_name}_ilike("%\#{@search_term}%")
    end

    query.distinct
  end
end
      FILE
    end
  end

  def add_search_controller
    create_file "app/controllers/#{singular_table_name}_search_controller.rb" do <<-FILE
class #{singular_table_name.capitalize}SearchController < ApplicationController

  def search_example
    @#{plural_table_name} = #{singular_table_name.capitalize}.all
  end

  def search
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end
  @#{plural_table_name} = #{singular_table_name.capitalize}Search.new(@search_inputs).search

    respond_to do |format|
      format.js
    end
  end
end
      FILE
    end
  end

  def add_search_form
    create_file "app/views/#{singular_table_name}_search/_search_form.html.erb" do <<-FILE
<%= simple_form_for :search_inputs, {url: search_#{plural_table_name}_path, method: :get, remote: true} do |f| %>
  <%= f.text_field :search_term, placeholder: "Stöbern", autocomplete: :off, class: "form-control" %>
  <%= f.submit "Suchen", id: "trigger_search", class: "btn btn-primary" %>
<% end %>


<script>
    $(document).ready(function(){
      var records_div = ".#{plural_table_name}"
      var search_records = "#search_inputs_search_term";
      var trigger_records = "#trigger_search";

      $( trigger_records ).click(function() {
        if ($( records_div ).html() != "<div class=\"mx-auto loader\"></div>"){
          $( records_div ).html( "<div class=\"mx-auto loader\"></div>" );
        }
      });

        $( search_records ).keyup(function() {
          if ($( search_records ).val().length > 3){
            if ($( records_div ).html() != "<div class=\"mx-auto loader\"></div>"){
              $( records_div ).html( "<div class=\"mx-auto loader\"></div>" );
            }
            $(trigger_records).click();
          }
        });
    });
</script>

      FILE
    end
  end

  def add_js_for_form
    create_file "app/views/#{singular_table_name}_search/search.js.erb" do <<-FILE
var records_div = ".#{plural_table_name}";

$( records_div ).fadeOut( "fast", function() {

    content = $("<%= escape_javascript( render partial: "#{plural_table_name}/card", collection: @#{plural_table_name}, as: :#{singular_table_name} ) %>")

    $(records_div).fadeOut("fast", function(){
      $(records_div).empty().append(content).fadeIn("fast");
    });

});
      FILE
    end
  end

  def add_search_example
    create_file "app/views/#{singular_table_name}_search/search_example.html.erb" do <<-FILE
<div class="container">
  <%= render "#{singular_table_name}_search/search_form", #{plural_table_name}: @#{plural_table_name} %>
  <div class="#{plural_table_name}">
    <%= render partial: "#{plural_table_name}/show", collection: @#{plural_table_name}, as: :#{singular_table_name} %>
  </div>
</div>
      FILE
    end
  end

  def add_routes
    route "get '/#{singular_table_name}_search/search', to: '#{singular_table_name}_search#search', as: 'search_#{plural_table_name}'"
    route "get '/#{singular_table_name}_search/search_example', to: '#{singular_table_name}_search#search_example'"
  end

  def save_each_record_and_create_search_field
    run "rails runner \"#{singular_table_name.capitalize}.find_each(&:save)\""
  end

end
