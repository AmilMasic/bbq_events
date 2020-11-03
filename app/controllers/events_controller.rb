class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    if user_signed_in?
      @event = Event.new
      @user_event = @event.user_events.build(user_id: current_user.id)
      # @user_event.build_user
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
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    if helpers.find_event_creator(@event)
      render :edit
    else
      redirect_to @event, notice: 'You are not authorized to edit this event'
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
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

end
