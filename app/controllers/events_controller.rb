class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    def new 
        @event = Event.new
    end
    
    def create
        event = Event.new
        event.name = params[:event][:name]
        event.description = params[:event][:description]
        if event.save
            flash[:notice] = "Event save successfully."
        else
            flash[:notice] = "Event not save."
        end
        redirect_to "/events"
    end

    def show
        @event = Event.find(params[:id])
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        event = Event.find(params[:id])
        event.name = params[:event][:name]
        event.description = params[:event][:description]
        if event.save
            flash[:notice] = "Event updated."
        else
            flash[:notice] = "Event updated Fails. Try later."
        end
        redirect_to "/events"
    end

    def makecomment
        @event = Event.find(params[:event_id])
        Comment.create(commentable: @event,comment_body: params[:comment],
                        user_name: params[:name])
        flash[:notice] = "you commented on an event."               
        #  p params[:name]
        #  p params[:comment]
        redirect_to "/events"
    end
end
