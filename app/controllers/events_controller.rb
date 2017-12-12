class EventsController < ApplicationController
	
	#GET /events/index
	#GET /events
	def index
		@events = Event.all
	end

	#GET /events/new
	def new
		@event = Event.new
	end

	#POST /events/create
	def create
		@event =  Event.new(event_params)
		@event.save

		redirect_to :action => :index
	end

	#GET /events/show
	def show
		@event = Event.find(params[:id])
		@page_title = @event.name
	end

	def edit
		@event = Event.find(params[:id])		
	end	

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)

		redirect_to :action => :show, :id =>@event
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to :action => :index
	end

	private
	def event_params
		params.require(:event).permit(:name,:description)
	end

end
