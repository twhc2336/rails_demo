# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [
	{
		name: "3C",
		subcategories: ["電腦","手機","家電","相機","錶"]
	},
	{
		name: "美食",
		subcategories: ["飲品","零食","泡麵","麵包"]
	},
	{
		name: "書籍",
		subcategories: ["中文書","英文書","雜誌","小說"]
	},
	{
		name: "育樂",
		subcategories: ["玩具","音樂","電玩","旅遊"]
	},
	{
		name: "服飾",
		subcategories: ["男裝","女裝","運動","休閒"]
	}
]

categories.each do |c|
 category = Category.create(name: c[:name])
 c[:subcategories].each do |s|
	 subcategory = Subcategory.create(name: s, category: category)
 end
end

subcategory = Subcategory.find_by(name: "錶")
(1..50).each do |t|
	product = {
		name: "clock#{t}",
		description: "clock#{t} desc",
		price: 19500,
		image_url: "https://images.pexels.com/photos/9352/glass-time-watch-business.jpg?h=350&auto=compress&cs=tinysrgb",
		subcategory: subcategory
	}
	Product.create(product)
end
