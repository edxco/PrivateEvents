class EventsController < ApplicationController
    before_action :set_event, only: [:show, :destroy]
    before_action :require_user, except: [:show, :index]

    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        @event.user = current_user
        if @event.save
            flash[:notice] = "Event was created succesfully"
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