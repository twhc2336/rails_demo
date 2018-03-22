class AdminController < ApplicationController
	def log_in
		session[:notice]
	end

	def create_session
		session[:notice] = nil
		@user = get_admin
		if @user.present?
			#flash[:notice] = "Hello, #{@user.name}"
			session[:notice] = "Hello, #{@user.name}"
		end
		redirect_to action: :log_in
	end

	def log_out
		session[:notice] = nil
		redirect_to root_path
	end
	
	private
	def get_admin
		@user = User.find_by(email: params[:email], password: params[:password])
	end
end
