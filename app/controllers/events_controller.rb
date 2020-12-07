class EventsController < ApplicationController
  before_action :set_event, only: %i[show destroy]
  before_action :require_user, except: %i[show index]

  def show
    @event = Event.find(params[:id])
    @attendee = Attendee.new
    
    @events_past = Event.past.order('datetime DESC')
    @events_future = Event.upcoming.order('datetime ASC')
  end

  def index
    @upcoming = Event.upcoming.sort { |a, b| b.date <=> a.date }
    @past = Event.past.sort { |a, b| b.date <=> a.date }
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.user = current_user
    if @event.save
      flash[:notice] = 'Event was created succesfully'
      redirect_to events_path
    else
      render 'new'
    end
  end

  def destroy
    @event.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :location)
  end
end
