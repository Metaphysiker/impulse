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
