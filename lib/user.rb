require 'rubygems'
require 'twilio-ruby'

class User


	def initialize
	end


	def add_to_cart (cart, menu, dish, price)
		raise "dish not on the menu" unless menu.dishes.has_key?(dish.to_sym)
		raise "incorrect price" unless menu.dishes[dish.to_sym] == price
		cart.cart << {dish: dish.to_sym, price: price}
	end

	def place_order (cart, price)
		raise "incorrect total price" unless price == cart.calc
		cart.checkout
	end

end