require 'rubygems'
require 'twilio-ruby'

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

	def read_cart
		cart.each......
	end

	def calc
		@cart.inject(0) { |memo, item| memo + item[:price] }
	end

	# def order_list
	# 	@cart.each do |pizza|
	# 		puts "#{pizza[:dish]}....... £#{pizza[:price]}"
	# 	end
	# end

	# def text
	# 	puts "Thank you! Your order was placed and will be delivered before #{time.hour}:#{time.min}."
	# 	order_list
	# 	puts "================="
	# 	puts "Total cost £#{calc}"
	# end

	def checkout(price)
		raise "incorrect total price" unless price == calc
		time = Time.new
		account_sid = 'ACa0d34f1fdc4a0a60f6fbb4bceab79a68'
		auth_token = '5927c969a38b60b667439fd622a05c94'
		@client = Twilio::REST::Client.new account_sid, auth_token
		message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}. Total cost: £#{calc}",
																							:to => "+447887886622",
																							:from => "+441663362053")
		puts message.sid
	end

end