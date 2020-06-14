class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user
  end

  def no_user?
    user
  end

  def update_batch?
    no_user?
  end
end
