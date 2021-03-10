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
    #current_month = I18n.t("date.month_names")[Date.today.month]
    #current_year = Date.today.year
    #older_name = "#{user.first_name} #{user.last_name} - #{user.recruitment_consultant} - #{user.disposal_period} - ALK #{user.unemployment_insurance_number}"

    compressed_filestream = Zip::OutputStream.write_buffer do |zos|

      range = user.disposal_period_start..user.disposal_period_end
      end_of_month_dates = range.map(&:end_of_month).uniq

      end_of_month_dates.each do |end_of_month_date|
        month = I18n.t("date.month_names")[end_of_month_date.month]
        year = end_of_month_date.year

        cv = generate_single_cv(user, "amm_bescheinigung")

        zos.put_next_entry "#{folder_name}/AMM/AMM-Bescheinigung_#{user.last_name}_#{month}_#{year}.odt"
        zos.write cv.generate
        #byebug
      end

      zos.put_next_entry "#{folder_name}/Matchingformular.odt"
      matchingformular = File.open("odf-templates/Matchingformular.odt")
      zos.write matchingformular.read
      matchingformular.close
      zos.put_next_entry "#{folder_name}/Stammblatt_#{user.last_name}.ods"
      zos.write stammblatt.generate
      zos.put_next_entry "#{folder_name}/Mentoring_50+_Kundenzufriedenheit_#{user.last_name}.odt"
      zos.write kundenzufriedenheit.generate
    end

    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "#{folder_name}.zip"
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
    end

  end

end
