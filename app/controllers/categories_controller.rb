class CategoriesController < ApplicationController
	before_action :get_category, only: [:products]

	LIMIT_PRODUCTS_NUMBER = 12
	def products

		@ad = {
			title: "大型廣告",
			description: "廣告描述",
			action_title: "閱讀更多",
		}

		@page = params[:page]? params[:page].to_i: 1

		@categories = Category.all

		#TODO: tmp
		@products = @category.products || []

		@first_page = 1
		
		@last_page = (@products.count.to_f / LIMIT_PRODUCTS_NUMBER).ceil

		@products = @products.offset((@page - 1) * LIMIT_PRODUCTS_NUMBER).limit(LIMIT_PRODUCTS_NUMBER) if @products.present?

	end

	private
	def get_category
		@category = Category.find_by_id(params[:category_id])
	end

end
