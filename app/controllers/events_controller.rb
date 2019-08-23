class EventsController < ApplicationController
  def index
    @events = Event.all 
  end 

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created successfully!"
      redirect_to events_url
    else
      flash[:danger] = "Error creating this event!"
      render :new
    end
  end 

  private
  def event_params
    params.require(:event).permit(:description, :location, :date)
  end 
end
