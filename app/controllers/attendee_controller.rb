class AttendeeController < ApplicationController
  def create
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      redirect_to user_path(current_user.id)
    # redirect_back(fallback_location: event_path(attendee_params[:event_id]))
    else
      render 'create'
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:user_id, :event_id)
  end
end
