class AdminController < ApplicationController
	def log_in
		#@name = get_current_user.try(:name)
	end

	def create_session
		session[:notice] = nil
		user = get_admin
		if user.present?
			flash[:notice] = "Hello, #{user.name}"
			session[:current_user_id] = user.id
		end
		redirect_to action: :log_in
	end

	def log_out
		session[:notice] = nil
		session[:current_user_id] = nil
		#redirect_to root_path
	end

	private
	def get_admin
		return User.find_by(email: params[:email], password: encrypted(params[:password]))
	end

	def encrypted(str)
		return "abc" + str
	end
end
