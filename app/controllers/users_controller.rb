class UsersController < ApplicationController

  def create_user
    user = User.create(user_params)
    #byebug
    sign_in user

    flash[:notice] = "Account wurde erstellt!"

    redirect_back(fallback_location: exchange_path)
  end

  def edit_user
    user = User.find(params[:id])
    user.update(edit_user_params)

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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :cover)
  end

  def edit_user_params
    params.require(:user).permit(:first_name, :last_name, :cover, :email)
  end
end
