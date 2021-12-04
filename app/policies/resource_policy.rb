class ResourcePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user
  end

  def create?
    new?
  end

  def edit?
    user&.admin
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
