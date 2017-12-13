class EventsController < ApplicationController
	before_action :set_event, :only => [:show,:edit,:update,:destroy]
	
	#GET /events/index
	#GET /events
	def index
		#@events = Event.all
		@events = Event.page(params[:page]).per(2)
	end

	#GET /events/:id
	def show
		#@event = Event.find(params[:id])
		@page_title = @event.name
	end

	#GET /events/new
	def new
		@event = Event.new
	end

	#POST /events
	def create
		@event =  Event.new(event_params)
		if @event.save			
			redirect_to events_path
			flash[:notice] = "event was successfully created"
		else
			render new_event_path #:action => :new
		end		
	end

	#GET /events/:id/edit
	def edit
		#@event = Event.find(params[:id])		
	end	

	#PATCH /events/:id
	def update
		#@event = Event.find(params[:id])
		if @event.update(event_params)
			redirect_to event_path(@event) #:action => :show, :id =>@event
			flash[:notice] = "event was successfully updated"
		else	
			render :action => :edit
		end		
	end

	#DELETE /events/:id
	def destroy
		#@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path	#:action => :index
		flash[:notice] = "event was	successfully deleted"
	end

	private
	def event_params
		params.require(:event).permit(:name,:description)
	end

	def set_event
		@event = Event.find(params[:id])
	end

end
