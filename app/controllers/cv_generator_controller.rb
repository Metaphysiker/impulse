require 'libreconv'

class CvGeneratorController < ApplicationController

  include Rails.application.routes.url_helpers


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

  def update_user_for_cv_page

  end

  def update_cv_units_for_user_page

  end

  def update_user_for_cv

    if user_signed_in?
      user = current_user
      user.update(user_params)
    else
      user = User.new
      user.update(user_params)
      sign_in user
    end
    #if User.find_by_email(params[:email]).present?
    #  user = User.find_by_email(params[:email])
    #else
    #  user = User.new
    #end


    @user = user
    #byebug
    #redirect_back(fallback_location: exchange_path)
  end

  def update_cv_units_for_user

  end

  def my_cvs
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    #generate_single_cv_and_save
    #generate_single_cv_and_save
  end

  def my_cvs_in_production
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    #generate_single_cv_and_save
    @user.cvs.delete_all

    #cvs will be generated in the File

    #generate_single_cv_and_save
    #generate_single_cv_and_save
  end

  def loading_screen
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    @user.cvs.delete_all
  end

  def generate_cvs
    @user = current_user
    #generate_single_cv_and_save
    @user.cvs.delete_all
    ["stats", "orangeblock", "wave", "blueblock", "bubbles", "dotty", "bluetop", "greenblock", "greenleft", "substantial", "bluey", "simple", "classical", "red"].each do |name|
      generate_single_cv_and_save(name)
    end

    redirect_to cv_generator_my_cvs_path
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

  def generate_all_cvs
    user = current_user
    user.cvs.purge
    redirect_to my_cvs_path
  end

  def generate_and_get_single_cv
    name = params[:name]
    @cv = generate_single_cv_and_save(name)
  end

  def generate_single_cv_and_save(file_name)
    #attribute_array = ["last_name", "first_name"]
    user = current_user
    #if params[:file_name].present?
    #  file_name = params[:file_name]
    #else
    #  file_name = "substantial"
      #file_name = Rails.root.join("public/cv/substantial/substantial-cv.odt")
      #file_name = Rails.root.join("public/cv/bluey/bluey-cv.odt")
    #end

    cover_filename  = ""
    if false #user.cover.attached?
      cover_filename = "#{user.cover.filename}"
      file = File.new(Rails.root.join('public', 'cv', 'images', 'temporary', "#{user.cover.filename}"), "w+", encoding: 'ascii-8bit')
      #tempfile << cv.generate
      file.write(user.cover.download)
      file.rewind
      file.close
      cover_filename = "temporary/#{user.cover.filename}"

    else
      cover_filename = "professional.jpg"
    end

    #unless File.file?("public/cv/images/#{cover_filename}")
    #  cover_filename = "professional.jpg"
    #end


    file_path = Rails.root.join("public/cv/#{file_name}/#{file_name}-cv.odt")

    odf = ODFReport::Report.new(file_path) do |r|

      r.add_field(:current_date, "#{I18n.l(Date.today)}")
      #r.add_image :cover, rails_blob_url(user.cover, disposition: "attachment")
      #r.add_image :cover, rails_blob_url(ActiveStorage::Blob.service.path_for(user.cover), disposition: "attachment")
      #r.add_image :cover, ActiveStorage::Blob.service.path_for(user.cover)
      #r.add_image :cover, ActiveStorage::Blob.service.send(:path_for, user.cover)
      r.add_image :cover, "public/cv/images/#{cover_filename}"
      #r.add_image :cover, user.cover

      #r.add_image :cover1, "public/cv/images/temporary/#{cover_filename}"

      #r.add_image :cover1, Rails.root.join("app", "assets", "images", "compass.jpg").to_s

      User.showable_attribute_names_for_cv.each do |attribute|
        r.add_field attribute.to_sym, user.public_send(attribute)
      end

      CvUnit.categories.each do |category|

        r.add_section("#{category}-section", user.cv_units.where(category: category).order(:start_date).reverse_order) do |s|
          s.add_field(:cv_unit_name, :name)
          s.add_field(:cv_unit_content, :content_html_safe)
          puts s.inspect
          s.add_section("#{category}-list-section", :content_split_by_new_line) do |l|
            l.add_field(:cv_unit_list_item) { |n| n}
          end

          #s.add_text(:cv_unit_content, :content)
          s.add_field(:cv_unit_start_date, :start_date)
          s.add_field(:cv_unit_end_date, :end_date)
          s.add_field(:cv_unit_start_date_year, :start_date_year)
          s.add_field(:cv_unit_end_date_year, :end_date_year)
          s.add_field(:cv_unit_start_date_month_year, :start_date_month_year)
          s.add_field(:cv_unit_end_date_month_year, :end_date_month_year)
          s.add_field(:cv_unit_company, :company)
          s.add_field(:cv_unit_location, :location)
        end
      end
    end

    cvs_with_same_name = user.cvs.where(name: file_name)
    cvs_with_same_name.delete_all
    cv = Cv.create(name: file_name)
    user.cvs << cv
    #byebug
    #tempfile = Tempfile.new("test.odt", encoding: 'ascii-8bit')
    #tempfile.write(odf.generate)
    #tempfile.rewind
    #cv.odt.attach(io: tempfile, filename: "#{file_name}.odt")
    #Libreconv.convert(tempfile, Rails.root.join('odf-templates', 'rendered', "#{file_name}.pdf"))
    #tempfile.close    tempfile = Tempfile.new("test.odt", encoding: 'ascii-8bit')
    #tempfile.write(odf.generate)
    #tempfile.rewind
    #cv.odt.attach(io: tempfile, filename: "#{file_name}.odt")
    #Libreconv.convert(tempfile, Rails.root.join('odf-templates', 'rendered', "#{file_name}.pdf"))
    #tempfile.close

    file = File.new(Rails.root.join('odf-templates', 'rendered', "#{file_name}.odt"), "w+", encoding: 'ascii-8bit')
    #tempfile << cv.generate
    file.write(odf.generate)
    file.rewind
    cv.odt.attach(io: file, filename: "#{file_name}.odt")
    file.close
    #send_data file_to_store, filename: "#{file_name}.odt"

    #puts Rails.root.join('odf-templates','testicus.odt')
    #Libreconv.convert(rails_blob_url(user.cvs.last, disposition: "attachment"), '/zusers/ricn/pdf_documents/my_document_as.pdf')
    #Libreconv.convert(Rails.root.join('odf-templates','testicus.odt').to_s, Rails.root.join('odf-templates','testicus.pdf'))

    #Libreconv.convert(Rails.root.join('odf-templates','testicus.odt'), Rails.root.join('odf-templates', 'rendered', "#{file_name}.pdf"))
    #Libreconv.convert(rails_blob_url(cv.odt), Rails.root.join('odf-templates', 'rendered', "#{file_name}.pdf"))
    Libreconv.convert(Rails.root.join('odf-templates', 'rendered', "#{file_name}.odt"), Rails.root.join('odf-templates', 'rendered', "#{file_name}.pdf"))

    cv.pdf.attach(io: File.open(Rails.root.join('odf-templates', 'rendered', "#{file_name}.pdf")), filename: "#{file_name}.pdf", content_type: 'application/pdf')

    #File.delete(Rails.root.join('public', 'cv', 'images', 'temporary', "#{user.cover.filename}")) if File.exist?(Rails.root.join('public', 'cv', 'images', 'temporary', "#{user.cover.filename}"))


    cv

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
          s.add_field(:cv_unit_location, :location)
          s.add_field(:cv_unit_company, :company)
          s.add_field(:cv_unit_job)
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
    :job_title, :website, :short_description, :marital_status,
    :nationality, :long_description, :power_word1, :power_word2, :power_word3,
    :quote, :expertise_ids => [])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
