require 'rubygems'
require 'twilio-ruby'

class User

	def initialize
		account_sid = 'ACa0d34f1fdc4a0a60f6fbb4bceab79a68'
		auth_token = '5927c969a38b60b667439fd622a05c94'
		@client = Twilio::REST::Client.new account_sid, auth_token
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