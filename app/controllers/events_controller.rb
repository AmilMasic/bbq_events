class EventsController < ApplicationController

  #note find_event does not work in :delete
  before_action :find_event, only: [:show, :edit, :update]

  def index
    @events = Event.all
  end

  def finished
    @events = Event.all.not_active
  end

  def new
    if user_signed_in?
      @event = Event.new
      @user_event = @event.user_events.build(user_id: current_user.id)
    else
      redirect_to root_path, notice: 'Thou Shalt Nought duuu dat :( Please sing in. '
    end
  end


  def create
    @event = Event.new(event_params)
    helpers.set_user_event_user(@event)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
  end

  def edit
    if helpers.find_event_creator(@event)
      render :edit
    else
      redirect_to @event, notice: 'You are not authorized to edit this event'
    end
  end

  def update
      if @event.update(event_params)
        redirect_to @event
      else
        render :edit
      end
  end

  def destroy
    @event = Event.find(params[:id])
    if helpers.find_event_creator(@event)
      @event.destroy
      redirect_to events_path, notice: 'Deleted'
    else
      redirect_to events_path, notice: 'You are not authorized to delete this event.'
    end
  end


  private

  def event_params
    params.require(:event).permit(:id, :eventname, :location, :finished, user_events_attributes: [:id, :foodname, :foodtype, :fuel, :user_id])
  end

  def find_event
   @event = Event.find(params[:id])
   if !@event
     flash[:message] = "Event was not found."
     redirect_to events_path
   end
  end

end
