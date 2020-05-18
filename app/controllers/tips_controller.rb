class TipsController < ApplicationController
  before_action :set_tip, only: [:show, :edit, :update, :destroy]
  def index
    @tips = policy_scope(Tip)
    @how_tos = @tips.where(tip_type: 'How To')
    @solutions = @tips.where(tip_type: 'Solution')
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
    @tip = Tip.find(params[:id])
  end

  def tip_params
    params.require(:tip).permit(:tip_type, :title, :content)
  end
end
