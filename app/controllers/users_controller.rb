class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def edit
    #@user = User.find()
  end

  def create_user_as_user
    user = User.create(user_params)
    #byebug
    sign_in user

    flash[:notice] = "Account wurde erstellt!"

    redirect_back(fallback_location: exchange_path)
  end

  def create_user_as_admin
    user = User.create(user_params)
    #byebug
    #sign_in user

    flash[:notice] = "Account wurde erstellt!"

    redirect_to user_path(user)
  end

  def update_user
    user = User.find(params[:id])
    user.update(user_params)

    flash[:notice] = "Account wurde aktualisiert!"
    #byebug
    redirect_back(fallback_location: exchange_path)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    flash[:notice] = "Account wurde aktualisiert!"
    #byebug
    redirect_back(fallback_location: exchange_path)
  end

  def workspace
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def show
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def create_files_for_impulse
    user = User.find(params[:id])
    current_month = I18n.t("date.month_names")[Date.today.month]
    current_year = Date.today.year
    folder_name = "#{user.first_name} #{user.last_name} - #{user.recruitment_consultant} - #{user.disposal_period} - ALK #{user.unemployment_insurance_number}"

    kundenzufriedenheit = ODFReport::Report.new("odf-templates/Mentoring_50+_Kundenzufriedenheit_NAME.odt") do |r|
      r.add_field :last_name, user.last_name
      r.add_field :first_name, user.first_name
      r.add_field :email, user.email
      r.add_field :phone, user.phone
      r.add_field :address, user.address
      r.add_field :personal_number, user.personal_number
      r.add_field :unemployment_insurance_number, user.unemployment_insurance_number
      r.add_field :current_month, current_month
      r.add_field :current_year, current_year
      r.add_field :disposal_period_start, I18n.l(user.disposal_period_start)
      r.add_field :disposal_period_end, I18n.l(user.disposal_period_end)
      r.add_field :birth_day, I18n.l(user.birth_day)
      r.add_field :recruitment_consultant, user.recruitment_consultant
    end

    stammblatt = ODFReport::Report.new("odf-templates/Stammblatt_NAME.ods") do |r|
      r.add_field :last_name, user.last_name
      r.add_field :first_name, user.first_name
      r.add_field :email, user.email
      r.add_field :phone, user.phone
      r.add_field :address, user.address
      r.add_field :personal_number, user.personal_number
      r.add_field :unemployment_insurance_number, user.unemployment_insurance_number
      r.add_field :current_month, current_month
      r.add_field :current_year, current_year
      r.add_field :disposal_period_start, I18n.l(user.disposal_period_start)
      r.add_field :disposal_period_end, I18n.l(user.disposal_period_end)
      r.add_field :birth_day, I18n.l(user.birth_day)
      r.add_field :recruitment_consultant, user.recruitment_consultant
    end

    compressed_filestream = Zip::OutputStream.write_buffer do |zos|

      range = user.disposal_period_start..user.disposal_period_end
      end_of_month_dates = range.map(&:end_of_month).uniq

      end_of_month_dates.each do |end_of_month_date|
        month = I18n.t("date.month_names")[end_of_month_date.month]
        year = end_of_month_date.year

        amm_bescheinigung = ODFReport::Report.new("odf-templates/AMM-Bescheinigung_NAME_MONTH_YEAR.odt") do |r|
          r.add_field :last_name, user.last_name
          r.add_field :first_name, user.first_name
          r.add_field :email, user.email
          r.add_field :phone, user.phone
          r.add_field :address, user.address
          r.add_field :personal_number, user.personal_number
          r.add_field :unemployment_insurance_number, user.unemployment_insurance_number
          r.add_field :current_month, month
          r.add_field :current_year, year
          r.add_field :disposal_period_start, I18n.l(user.disposal_period_start)
          r.add_field :disposal_period_end, I18n.l(user.disposal_period_end)
          r.add_field :birth_day, I18n.l(user.birth_day)
          r.add_field :recruitment_consultant, user.recruitment_consultant
        end

        zos.put_next_entry "#{folder_name}/AMM/AMM-Bescheinigung_#{user.last_name}_#{month}_#{year}.odt"
        zos.write amm_bescheinigung.generate
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

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :cover,
      :location, :plz, :street, :phone, :birth_day, :recruitment_consultant,
    :disposal_period_start, :disposal_period_end, :personal_number, :unemployment_insurance_number)
  end

  def set_user
    @user = User.find(params[:id])
  end

  #def edit_user_params
  #  params.require(:user).permit(:first_name, :last_name, :cover, :email)
  #end
end
