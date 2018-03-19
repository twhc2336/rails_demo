class ProductsController < ApplicationController
	#skip_before_action :verify_authenticity_token
	#before_action :get_user
	#after_action :get_user,only: [:index]
	#skip_after_action :get_user,except: [:new]

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
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def get_user
		flash[:notice] = "no user!"
	end

	def product_permit
		params.permit([:name,:description,:image_url,:price])
	end
end
