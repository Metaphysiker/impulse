class CvGeneratorController < ApplicationController
  def overview

  end

  def cv_generator
    user = current_user #User.find(params[:id])
    #cv = generate_single_cv(user, Rails.root.join("public/cv/substantial-cv.odt"))

    #compressed_filestream.rewind
    #send_data cv.generate, filename: "substantial.odt"
    #send_data zippy.read, filename: "zippy.zip"
    #send_data stammblatt.generate, filename: "AMM-Bescheinigung_#{user.last_name}_#{current_month}_#{current_year}.odt"
    #send_data stammblatt.generate, filename: "AMM-Bescheinigung_#{user.last_name}_#{current_month}_#{current_year}.ods"
    #send_data zip
  end

  def update_user_for_cv

    if User.find_by_email(params[:email]).present?
      user = User.find_by_email(params[:email])
    else
      user = User.new
    end

    user.update(user_params)

    @user = user
    #byebug
    #redirect_back(fallback_location: exchange_path)
  end

  def cv_generator1
    user = current_user #User.find(params[:id])
    cv = generate_single_cv(user, Rails.root.join("public/cv/substantial-cv.odt"))

    #compressed_filestream.rewind
    send_data cv.generate, filename: "substantial.odt"
    #send_data zippy.read, filename: "zippy.zip"
    #send_data stammblatt.generate, filename: "AMM-Bescheinigung_#{user.last_name}_#{current_month}_#{current_year}.odt"
    #send_data stammblatt.generate, filename: "AMM-Bescheinigung_#{user.last_name}_#{current_month}_#{current_year}.ods"
    #send_data zip
  end

  def show_public_pdf_inline
    user = current_user
    if params[:file_name].present?
      file_name = params[:file_name]
    else
      file_name = "substantial"
      #file_name = Rails.root.join("public/cv/substantial/substantial-cv.odt")
      #file_name = Rails.root.join("public/cv/bluey/bluey-cv.odt")
    end

    file_path = Rails.root.join("public/cv/#{file_name}/#{file_name}-preview.pdf")

    send_file(file_path, :filename => "#{file_name}.pdf", :disposition => 'inline', :type => "application/pdf")
  end

  def generate_single_cv
    #attribute_array = ["last_name", "first_name"]
    user = current_user
    if params[:file_name].present?
      file_name = params[:file_name]
    else
      file_name = "substantial"
      #file_name = Rails.root.join("public/cv/substantial/substantial-cv.odt")
      #file_name = Rails.root.join("public/cv/bluey/bluey-cv.odt")
    end

    file_path = Rails.root.join("public/cv/#{file_name}/#{file_name}-cv.odt")

    cv = ODFReport::Report.new(file_path) do |r|
      User.showable_attribute_names_for_cv.each do |attribute|
        r.add_field attribute.to_sym, user.public_send(attribute)
      end

      CvUnit.categories.each do |category|
        r.add_section("#{category}-section", user.cv_units.where(category: category).order(:start_date).reverse_order) do |s|
          s.add_field(:cv_unit_name, :name)
          s.add_field(:cv_unit_content, :content_html_safe)
          #s.add_text(:cv_unit_content, :content)
          s.add_field(:cv_unit_start_date, :start_date)
          s.add_field(:cv_unit_end_date, :end_date)
          s.add_field(:cv_unit_start_date_month_year, :start_date_month_year)
          s.add_field(:cv_unit_end_date_month_year, :end_date_month_year)
        end
      end

    end
    send_data cv.generate, filename: "#{file_name}.odt"
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :cover,
      :location, :plz, :street, :phone, :birth_day,
    :job_title, :website, :short_description, :expertise_ids => [])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
