class StaticPagesController < ApplicationController
  def welcome
    image = ActionController::Base.helpers.asset_url("pigs.jpg", type: :image)

    set_meta_tags title: "Kennsch Ethik?", reverse: true,
              description: "Kennsch Ethik? ist ein Portal für Tierethik und Tierschutz-Aktivismus.",
              og: {
                title: :title,
                description: :description,
                url: root_path,
                image: image
              }
  end

  def texts
    @page_title       = 'Texte & Argumente'
    @page_description = 'Eine Übersicht aller Texte und Argumente auf Kennsch Ethik?'
    @page_keywords    = 'Tierethik, Argumente'
  end

  def debate_a_vegan
    response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"
    render "static_pages/debate_a_vegan", layout: "application_blank"
  end

  def dashboard
    authorize :static_page, :dashboard?
  end

  def impressum

  end

  def exchange
    user_ids = User.includes(:skills).where.not(skills: {id: nil}).pluck(:id)
    user_ids.unshift(current_user.id) unless current_user.blank?
    user_ids.uniq!
    @users = User.where(id: user_ids).sort_by {|m| user_ids.index(m.id)}

  end

  def cv_generator1
    current_user
  end

  def cv_generator
    user = current_user #User.find(params[:id])
    cv = generate_single_cv(user, Rails.root.join("public/cv/substantial-cv.odt"))

    #compressed_filestream.rewind
    send_data cv.generate, filename: "substantial.odt"
    #send_data zippy.read, filename: "zippy.zip"
    #send_data stammblatt.generate, filename: "AMM-Bescheinigung_#{user.last_name}_#{current_month}_#{current_year}.odt"
    #send_data stammblatt.generate, filename: "AMM-Bescheinigung_#{user.last_name}_#{current_month}_#{current_year}.ods"
    #send_data zip
  end

  def generate_single_cv(user, file_path)
    #attribute_array = ["last_name", "first_name"]
    cv = ODFReport::Report.new(file_path) do |r|
      User.showable_attribute_names_for_cv.each do |attribute|
        r.add_field attribute.to_sym, user.public_send(attribute)
      end

      CvUnit.categories.each do |category|
        r.add_section("#{category}-section", user.cv_units.where(category: category)) do |s|
          s.add_field(:cv_unit_name, :name)
          s.add_field(:cv_unit_content, :content)
          s.add_field(:cv_unit_start_date, :start_date)
          s.add_field(:cv_unit_end_date, :end_date)
          s.add_field(:cv_unit_start_date_month_year, :start_date.strftime("%B %Y"))
          s.add_field(:cv_unit_end_date_month_year, :end_date.today.strftime("%B %Y"))
        end
      end

    end

  end

end
