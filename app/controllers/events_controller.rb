class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.user_events.build
  end


  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
  end


  private
  def event_params
    params.require(:event).permit(:id, :eventname, :location, user_events_attributes: [:id, :foodname, :foodtype, :fuel])
  end

end
