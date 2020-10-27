class UserEventsController < ApplicationController

    def index
      @events = Event.all
    end

    def new
      @user_event = UserEvent.new
      @user_event.build_event

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
    end

    def update
      @user_event = UserEvent.find_by(id: params[:id])
      if current_user = @user_event.user
        if @user_event.update(user_event_params)
          redirect_to @user_event
        else
          render :edit
        end
      else
        flash[:notice] = 'You are not authorized to make this change'
      end
    end

    def destroy
    UserEvent.find(params[:id]).destroy
    redirect_to events_url
  end

    private

    def user_event_params
      params.require(:user_event).permit(:id, :user_id, :foodname, :foodtype, :fuel, event_attributes: [:id, :location, :eventname], user_attributes: [:id])
    end

end
