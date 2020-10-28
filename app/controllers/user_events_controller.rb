class UserEventsController < ApplicationController
  # before action not working, issue due to devise, need more research into this.
  # before_action :user_signed_in?, only: [:new]
    def index
      @events = Event.all
    end

    def new
      if user_signed_in?
        @user_event = UserEvent.new
        @user_event.build_event
      else
        redirect_to root_path, notice: 'Thou Shalt Nought duuu dat :( Please sing in. '
      end
    end


    def create
      @user_event = UserEvent.new(user_event_params)
      @user_event.user = current_user
      if @user_event.save
        redirect_to @user_event
      else
        render :new
      end
    end

    def show
      @user_event = UserEvent.find(params[:id])
    end

    def edit
      @user_event = UserEvent.find(params[:id])
      redirect_to root_path, notice: 'You are not authorized to edit this event!' unless  @user_event.user == current_user
    end

    def update
      @user_event = UserEvent.find_by(id: params[:id])
        if @user_event.update(user_event_params)
          redirect_to @user_event
        else
          render :edit
        end
    end

    def destroy
      @user_event = UserEvent.find(params[:id])
      if user_signed_in?
        @user_event.destroy
        redirect_to events_path, notice: 'Deleted'
      else
        redirect_to events_path, notice: 'You are not authorized to delete this event.'
      end
    end

    private

    def user_event_params
      params.require(:user_event).permit(:id, :user_id, :foodname, :foodtype, :fuel, event_attributes: [:id, :location, :eventname], user_attributes: [:id])
    end

end
