class UserEventsController < ApplicationController

    private

    def user_event_params
      params.require(:user_event).permit(:id, :user_id, :foodname, :foodtype, :fuel, event_attributes: [:id, :location, :eventname], user_attributes: [:id])
    end

end
