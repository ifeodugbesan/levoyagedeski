class ProjectMemberPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def destroy?
    record.career.project_members.map(&:user).include?(user)
  end

  def accept_membership?
    record.career.user == user
  end

  def reject_membership?
    record.career.user == user
  end
end
