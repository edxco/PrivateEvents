module ApplicationHelper
  def attendance_user(user, event)
    return render inline: "<%= link_to 'Login to assist', login_path%>" unless logged_in?

    if Attendee.where(user_id: user, event_id: event).any?
      render '/events/unattendEvent'
    else
      render '/events/attendEvent'
    end
  end

  def attendance_show(event)
    return render inline: "<%= link_to 'Login to assist', login_path%>" unless logged_in?

    if Attendee.where(user_id: current_user[:id], event_id: event).any?
      render inline: 'Attend'
    else
      render inline: 'UnAtttend'
    end
  end
end
