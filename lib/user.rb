class User

	attr_accessor :cart

	def read (menu)
		menu.dishes.each { |dish,price| puts "#{dish} : £#{price}" }
	end

	def add_to_cart (menu, dish, price)
		@cart = []
		raise "dish not on the menu" unless menu.dishes.has_key?(dish.to_sym)
		raise "incorrect price" unless menu.dishes[dish.to_sym] == price
		@cart << {dish: dish.to_sym, price: price}
	end

end