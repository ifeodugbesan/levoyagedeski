class ProjectMembersController < ApplicationController
  before_action :set_project_member, only: [:destroy, :accept_membership, :reject_membership]
  def create
    @project = Career.find(params[:career_id])
    @project_member = ProjectMember.new(project_member_params)
    @project_member.status = 'pending'
    @project_member.user = current_user
    @project_member.career = @project
    @project_member.save
    redirect_to career_path(@project)
    authorize @project_member
  end

  def destroy
    @project_member.destroy
    redirect_to career_path(@project_member.career)
    authorize @project_member
  end

  def accept_membership
    @project_member.update(status: 'approved')
    redirect_to career_path(@project_member.career)
    authorize @project_member
  end

  def reject_membership
    @project_member.update(status: 'rejected')
    redirect_to career_path(@project_member.career)
    authorize @project_member
  end

  private

  def set_project_member
    @project_member = ProjectMember.find(params[:id])
  end

  def project_member_params
    params.require(:project_member).permit(:reason)
  end
end
