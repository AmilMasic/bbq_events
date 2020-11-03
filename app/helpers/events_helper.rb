module EventsHelper
  def set_user_event_user(event)
    event.user_events.each do |user_event|
      user_event.user_id = current_user.id
    end
  end

  # Not a fan of finding this, there has to be a better way
  def find_event_creator(event)
    event.user_events.first.user == current_user
  end

end
