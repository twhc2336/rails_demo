class ProductsController < ApplicationController
	#skip_before_action :verify_authenticity_token
	#before_action :get_user
	#after_action :get_user,only: [:index]
	#skip_after_action :get_user,except: [:new]
	before_action :get_product, only: [:show,:edit,:update,:destroy]
	LIMIT_PRODUCTS_NUMBER = 12
	#PRODUCTS_COUNT = Product.count
	def index
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
		product = Product.create(product_permit)
		flash[:notice] = product.id 
		redirect_to action: :new
	end

	def show
		if @product.blank?
			redirect_to products_path
			return
		end
		@page = params[:page]
	end

	def edit
		#@product = Product.find(params[:id])
		if @product.blank?
			redirect_to products_path
			return
		end
		@page = params[:page]
	end

	def update
		#product = Product.find(params[:id])
		@product.update(product_permit)
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
		params.require(:product).permit([:name,:description,:image_url,:price])
	end

	def get_product
		@product = Product.find_by_id(params[:id])
	end

	def show_params
		flash[:notice] = params.to_s
	end

end
