class AdminPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def overview?
    #byebug
    #is_user_admin?(user)
    does_user_have_role?(user, "admin")
  end
end
