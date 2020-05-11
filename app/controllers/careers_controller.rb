class CareersController < ApplicationController
  before_action :set_career, only: [:show, :edit, :update, :destroy]
  def index
    @career = policy_scope(Career)
    @jobs = @career.where(career_type: 'Job')
    @projects = @career.where(career_type: 'Project')
  end

  def show
    @project_member = ProjectMember.new
    @career = Career.find(params[:id])
    authorize @career
  end

  def new
    @career = Career.new
    authorize @career
  end

  def create
    @career = Career.new(career_params)
    @career.user = current_user
    if @career.save
      update_project_members
      redirect_to career_path(@career)
    else
      render :new
    end
    authorize @career
  end

  def edit
    authorize @career
  end

  def update
    @career.update(career_params)
    ProjectMember.where(career: @career).destroy_all
    update_project_members
    redirect_to career_path(@career)
    authorize @career
  end

  def destroy
    @career.destroy
    redirect_to careers_path
    authorize @career
  end

  private

  def update_project_members
    params[:career][:user_ids].reject(&:blank?).each { |id| ProjectMember.create(career: @career, user: User.find(id)) }
  end

  def set_career
    @career = Career.find(params[:id])
  end

  def career_params
    params.require(:career).permit(:career_type, :title, :description, :company_name, :salary, :location, :contract, :link, :email, :image)
  end
end
