class AdminController < ApplicationController
  def overview
    @users = User.all
  end
end
