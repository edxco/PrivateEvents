module ApplicationHelper

    def attendance_user(user, event)
        
        return render inline: "<%= link_to 'Login to assist', login_path%>" unless logged_in?
        
        if Attendee.where(user_id: user, event_id: event).any?
            render "./events/unattendEvent"
        else
            render "./events/attendEvent"
        end
    end

end

