class UserEventsController < ApplicationController


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


    private

    def user_event_params
      params.require(:user_event).permit(:id, :user_id, :foodname, :foodtype, :fuel, event_attributes: [:id, :location, :eventname], user_attributes: [:id])
    end

end
