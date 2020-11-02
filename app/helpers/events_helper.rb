module EventsHelper
  def set_user_event_user(event)
    event.user_events.each do |user_event|
      user_event.user_id = current_user.id
    end
  end

  def authenticate_creator(event)
    event.user_events.first 
  end
end
