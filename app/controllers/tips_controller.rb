class TipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_tip, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @tips = policy_scope(Tip).search_by_title_and_content(params[:query])
      @how_tos = @tips.where(tip_type: 'How To')
      @solutions = @tips.where(tip_type: 'Solution')
    else
      @how_tos = policy_scope(Tip).where(tip_type: 'How To')
      @solutions = policy_scope(Tip).where(tip_type: 'Solution')
    end
    respond_to do |format|
      format.js { render partial: 'tips_content' }
      format.html
    end
  end

  def show
    authorize @tip
  end

  def new
    @tip = Tip.new
    authorize @tip
  end

  def create
    @tip = Tip.new(tip_params)
    @tip.user = current_user
    if @tip.save
      flash[:success] = "Tip created!"
      redirect_to tip_path(@tip)
    else
      render :new
    end
    authorize @tip
  end

  def edit
    authorize @tip
  end

  def update
    @tip.update(tip_params)
    redirect_to tip_path(@tip)
    authorize @tip
  end

  def destroy
    @tip.destroy
    flash[:danger] = "Tip deleted!"
    redirect_to tips_path
    authorize @tip
  end

  private

  def set_tip
    @tip = Tip.friendly.find(params[:id])
  end

  def tip_params
    params.require(:tip).permit(:tip_type, :title, :content)
  end
end
