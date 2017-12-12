class EventsController < ApplicationController
	before_action :set_event, :only => [:show,:edit,:update,:destroy]
	#GET /events/index
	#GET /events
	def index
		#@events = Event.all
		@events = Event.page(params[:page]).per(2)
	end

	#GET /events/new
	def new
		@event = Event.new
	end

	#POST /events/create
	def create
		@event =  Event.new(event_params)
		if @event.save
			redirect_to :action => :index
		else
			render :action => :new
		end
		flash[:notice] = "event was successfully created"
	end

	#GET /events/show
	def show
		#@event = Event.find(params[:id])
		@page_title = @event.name
	end

	def edit
		#@event = Event.find(params[:id])		
	end	

	def update
		#@event = Event.find(params[:id])
		if @event.update(event_params)
			redirect_to :action => :show, :id =>@event
		else	
			render :action => :edit
		end
		flash[:notice] = "event was successfully updated"
	end

	def destroy
		#@event = Event.find(params[:id])
		@event.destroy

		redirect_to :action => :index
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
