class UsersController < ApplicationController

  def new_user
    @user = User.new
  end

  def create_user
    user = User.create(user_params)
    #byebug
    sign_in user

    flash[:notice] = "Account wurde erstellt!"

    redirect_back(fallback_location: exchange_path)
  end

  def edit_user
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

  def create_files_for_impulse
    user = User.find(params[:id])
    current_month = Date.today.to_s
    current_month = Date.today.to_s

    report = ODFReport::Report.new("odf-templates/AMM-Bescheinigung_NAME_MONTH_YEAR.odt") do |r|
      r.add_field :last_name, user.last_name
      r.add_field :first_name, user.first_name
      r.add_field :personal_number, user.personal_number
      r.add_field :unemployment_insurance_number, user.unemployment_insurance_number
      r.add_field :current_month, current_month
      r.add_field :current_year, current_year
      r.add_field :disposal_period_start, user.disposal_period_start
      r.add_field :disposal_period_end, user.disposal_period_end
    end

    send_data report, filename: "test.odt"
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :cover,
      :location, :plz, :street, :phone, :birth_day, :recruitment_consultant,
    :disposal_period_start, :disposal_period_end)
  end

  #def edit_user_params
  #  params.require(:user).permit(:first_name, :last_name, :cover, :email)
  #end
end
