class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
