class AdminController < ApplicationController
	before_action :redirect_to_root_if_log_in, except: [:log_out]
	before_action :redirect_to_root_if_not_log_in, only: [:log_out]

	def log_in
		#@name = get_current_user.try(:name)
	end

	def create_session
		session[:current_user_id] = nil
		user = get_admin
		if user.present?
			flash[:notice] = "哈囉, #{user.name}"
			session[:current_user_id] = user.id
			redirect_to products_path
			return
		end
		flash[:notice] = "登入失敗！"
		redirect_to action: :log_in
	end

	def log_out
		session[:current_user_id] = nil
		flash[:notice] = "登出成功"
		redirect_to products_path
	end

	private
	def get_admin
		return User.find_by(email: params[:email], password: encrypted(params[:password]))
	end

	def encrypted(str)
		return "abc" + str
	end

	def redirect_to_root_if_not_log_in
		if !get_current_user
			flash[:notice] = "您尚未登入"
			redirect_to products_path
			return
		end
	end

	def redirect_to_root_if_log_in
		if get_current_user
			flash[:notice] = "已經登入"
			redirect_to products_path
			return
		end
	end


end
