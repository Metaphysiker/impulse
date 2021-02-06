class UsersController < ApplicationController

  def create_user
    user = User.create(user_params)
    #byebug
    sign_in user

    flash[:notice] = "Account wurde erstellt!"

    redirect_to exchange_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :cover)
  end
end
