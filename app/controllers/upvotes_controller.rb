class UpvotesController < ApplicationController
  def create
    tip = Tip.friendly.find(params[:tip_id])
    @upvote = Upvote.new(tip: tip, user: current_user)
    render partial: 'tips/upvote', locals: { tip: tip } if @upvote.save
    authorize @upvote
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy
    authorize @upvote
    render partial: 'tips/upvote', locals: { tip: @upvote.tip }
  end
end
