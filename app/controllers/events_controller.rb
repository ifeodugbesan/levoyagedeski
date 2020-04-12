class EventsController < ApplicationController
  def create
    @batch = Batch.find(params[:batch_id])
    @event = Event.new(event_params)
    @event.batch = @batch
    if @event.save
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
    @batch.destroy
  end

  private

  def set_batch
    @batch = Batch.find(paramd[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :time, :batch_id)
  end
end
