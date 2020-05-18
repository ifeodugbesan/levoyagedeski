class EventsController < ApplicationController
  before_action :set_batch, only: [:destroy]
  def create
    @batch = Batch.find(params[:batch_id])
    @event = Event.new(event_params)
    @event.batch = @batch
    if @event.save
      flash[:success] = "Event created!"
      redirect_to batch_path(@batch)
    else
      redirect_to batch_path(@batch), alert: 'Something went wrong'
    end
    authorize @event
  end

  def edit

  end

  def update

  end

  def destroy
    @event.destroy
    flash[:danger] = "Event deleted!"
    redirect_to batch_path(@event.batch)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :time, :batch_id)
  end
end
