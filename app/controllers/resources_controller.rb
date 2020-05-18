class ResourcesController < ApplicationController
  before_action :set_resources, only: [:edit, :update, :destroy]
  def index
    @resources = policy_scope(Resource)
  end

  def new
    @resource = Resource.new
    authorize @resource
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:success] = "Resource created!"
      redirect_to resources_path
    else
      render :new
    end
    authorize @resource
  end

  def edit
    authorize @resource
  end

  def update
    @resource.update(resource_params)
    redirect_to resources_path
    authorize @resource
  end

  def destroy
    @resource.destroy
    flash[:danger] = "Resource deleted!"
    redirect_to resources_path
    authorize @resource
  end

  private

  def set_resources
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:category, :title, :description, :link, :photo)
  end
end
