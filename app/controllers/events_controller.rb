class EventsController < ApplicationController
    before_action :set_event, only: [:show, :destroy]

    def show
    end

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            flash[:notice] = "Event was created succesfully"
            redirect_to events_path
        else
            render 'new'
        end
    end

    def destroy
        @event.destroy
        redirect_to events_path
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description)
    end

end