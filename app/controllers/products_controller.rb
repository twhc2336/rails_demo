class ProductsController < ApplicationController
	#skip_before_action :verify_authenticity_token
	#before_action :get_user
	#after_action :get_user,only: [:index]
	#skip_after_action :get_user,except: [:new]
	before_action :redirect_to_root_if_not_log_in, except: [:show, :index]
	before_action :get_product, only: [:show,:edit,:update,:destroy]

	LIMIT_PRODUCTS_NUMBER = 12
	#PRODUCTS_COUNT = Product.count
	def index
		@categories = Category.all

		@ad = {
			title: "大型廣告",
			description: "廣告描述",
			action_title: "閱讀更多",
		}

		@page = params[:page]? params[:page].to_i: 1

		@products = Product.all

		@first_page = 1
		@last_page = (@products.count.to_f / LIMIT_PRODUCTS_NUMBER).ceil

		#效能問題
		#@products = Product.all.[(@page - 1) * LIMIT_PRODUCTS_NUMBER,LIMIT_PRODUCTS_NUMBER]
		@products = Product.all.offset((@page - 1) * LIMIT_PRODUCTS_NUMBER).limit(LIMIT_PRODUCTS_NUMBER)
	end

	def new
		#@note = flash[:notice]
		@product = Product.new
	end

	def create
		#product = Product.create({name: params[:name],
		#	description: params[:description],
		#	image_url: params[:image_url],
		#	price: params[:price],
		#	})
		image = params[:product][:image]
		if image
			image_url = save_file(image)
		end
		product = Product.create(product_permit.merge({image_url: image_url}))	
		flash[:notice] = "建立成功"
		redirect_to action: :new
	end

	def show
		if @product.blank?
			redirect_to products_path
			return
		end
	end

	def edit
		#@product = Product.find(params[:id])
		if @product.blank?
			redirect_to products_path
			return
		end
	end

	def update
		image = params[:product][:image]
		if image
			image_url = save_file(image)
			@product.update(product_permit.merge({image_url: image_url}))
		else
			@product.update(product_permit)		
		end
		flash[:notice] = "更新成功"
		redirect_to action: :edit
	end

	def destroy
		@product.destroy
		redirect_to products_path
	end

	private
	
	def get_user
		flash[:notice] = "no user!"
	end

	def product_permit
		#params.permit([:name,:description,:image_url,:price])
		params.require(:product).permit([:name,:description,:price,:subcategory_id])
	end

	def get_product
		@product = Product.find_by_id(params[:id])
	end

	def show_params
		flash[:notice] = params.to_s
	end

	def redirect_to_root_if_not_log_in
		if !get_current_user
			#flash[:notice] = "您尚未登入"
			redirect_to products_path
			return
		end
	end

	def save_file(file)
		# 設定檔案位置
		# 建立新檔案位置
		# 把檔案寫入新的檔案位置
		# 回傳檔案位置
		new_dir_url = Rails.root.join('public','uploads/product_images')

		FileUtils.mkdir_p(new_dir_url) unless File.directory?(new_dir_url)

		new_file_url = new_dir_url + file.original_filename

		File.open(new_file_url,'w+b') do |new_file|
			new_file.write(file.read)
		end

		return '/uploads/product_images/' + file.original_filename
	end





end
