# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..50).each do |t|
	product = {
		name: "clock#{t}",
		description: "clock#{t} desc",
		price: 100,
		image_url: "https://images.pexels.com/photos/280402/pexels-photo-280402.jpeg?h=350&auto=compress&cs=tinysrgb"

	}

	Product.create(product)
end