class User

	attr_accessor :cart

	def initialize
		@cart = []
	end

	def read (menu)
		menu.dishes.each { |dish,price| puts "#{dish} : £#{price}" }
	end

	def add_to_cart (menu, dish, price)
		raise "dish not on the menu" unless menu.dishes.has_key?(dish.to_sym)
		raise "incorrect price" unless menu.dishes[dish.to_sym] == price
		@cart << {dish: dish.to_sym, price: price}
	end

	def calc
		@cart.inject(0) { |memo, item| memo + item[:price] }
	end

	def checkout(price)
		raise "incorrect total price" unless price == calc
	end

end