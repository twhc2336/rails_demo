class WelcomeController < ApplicationController

	#Get /welcome/say
	def say
		#views/welcome/say.html.erb
	end

	#GET /welcome/show
	def show
		@id = params[:id]
	end
end
