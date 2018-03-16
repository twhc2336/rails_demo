class HomeController < ApplicationController
	
	LIMIT_PRODUCTS_NUMBER = 12
	#PRODUCTS_COUNT = Product.count

	def index
		@ad = {
			title: "大型廣告",
			description: "廣告描述",
			action_title: "閱讀更多",
		}

		#@products = [
		#	{
		#	id: "1",
		#	name: "錶1",
		#	description: "復古的錶",
		#	image_url: "https://images.pexels.com/photos/39817/clock-pocket-watch-gold-valuable-39817.jpeg?w=940&h=650&auto=compress&cs=tinysrgb",
		#},
		#	{
		#	id: "2",
		#	name: "錶2",
		#	description: "復古的錶",
		#	image_url: "https://images.pexels.com/photos/280254/pexels-photo-280254.jpeg?w=940&h=650&auto=compress&cs=tinysrgb",
		#},
		#	{
		#	id: "3",
		#	name: "錶3",
		#	description: "復古的錶",
		#	image_url: "https://images.pexels.com/photos/9352/glass-time-watch-business.jpg?h=350&auto=compress&cs=tinysrgb",
		#},
		#	{
		#	id: "4",
		#	name: "錶4",
		#	description: "復古的錶",
		#	image_url: "https://images.pexels.com/photos/38267/clock-time-stand-by-38267.jpeg?h=350&auto=compress&cs=tinysrgb",
		#},
		#]

		#@products = []
		#(1..PRODUCTS_COUNT).each do |index|
		#	product = {
		#		id: index,
		#		name: "錶",
		#		description: "復古的錶#{index}",
		#		image_url: "https://images.pexels.com/photos/38267/clock-time-stand-by-38267.jpeg?h=350&auto=compress&cs=tinysrgb",
		#	}
		#	@products << product
		#end		
		#@products = @products[(@page - 1) * LIMIT_PRODUCTS_NUMBER,LIMIT_PRODUCTS_NUMBER]
		
		#效能問題
		#@products = Product.all.[(@page - 1) * LIMIT_PRODUCTS_NUMBER,LIMIT_PRODUCTS_NUMBER]

		@page = params[:page]? params[:page].to_i: 1

		@products = Product.all

		@first_page = 1
		@last_page = (@products.count.to_f / LIMIT_PRODUCTS_NUMBER).ceil
		
		@products = Product.all.offset((@page - 1)*LIMIT_PRODUCTS_NUMBER).limit(LIMIT_PRODUCTS_NUMBER)
	end

end
