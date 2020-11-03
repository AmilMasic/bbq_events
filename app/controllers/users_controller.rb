class UsersController < ApplicationController

  def home
    @events = Event.all.stil_active
  end

  def show
    @user = User.find(params[:id])
  end

end
