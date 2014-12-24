class User

	attr_accessor :cart

	def read (menu)
		menu.dishes.each { |dish,price| puts "#{dish} : £#{price}" }
	end

	def add_to_cart (menu, dish, price)
		@cart = []
		@cart << {dish: dish.to_sym, price: price}
	end

end