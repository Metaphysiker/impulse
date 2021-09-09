class AdminController < ApplicationController
  after_action :verify_authorized
  def overview
    authorize(:admin)
    @users = User.all
  end
end
