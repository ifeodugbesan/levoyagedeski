class BatchesController < ApplicationController
  def show
    @batch = Batch.find(params[:id])
    @events = Event.where(batch: @batch).order(time: :asc)
    @event = Event.new
    authorize @batch
  end
end
