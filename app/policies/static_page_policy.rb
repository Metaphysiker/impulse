class StaticPagePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def dashboard?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
