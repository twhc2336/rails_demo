class AdminController < ApplicationController
	def log_in
		#@name = get_current_user.try(:name)
	end

	def create_session
		session[:current_user_id] = nil
		user = get_admin
		if user.present?
			flash[:notice] = "Hello, #{user.name}"
			session[:current_user_id] = user.id
			redirect_to products_path
			return
		end
		flash[:notice] = "登入失敗！"
		redirect_to action: :log_in
	end

	def log_out
		session[:current_user_id] = nil
		flash[:notice] = "Log out successfully."
		redirect_to products_path
	end

	private
	def get_admin
		return User.find_by(email: params[:email], password: encrypted(params[:password]))
	end

	def encrypted(str)
		return "abc" + str
	end
end
