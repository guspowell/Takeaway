class Cart

	attr_reader :cart

	def initialize
		@cart = []
		account_sid = 'ACa0d34f1fdc4a0a60f6fbb4bceab79a68'
		auth_token = '5927c969a38b60b667439fd622a05c94'
		@client = Twilio::REST::Client.new account_sid, auth_token
	end

	def calc
		@cart.inject(0) { |memo, item| memo + item[:price] }
	end

	def send_text
		@time = Time.new
		message = @client.account.messages.create(:body => text,
																							:to => "+447887886622",
																							:from => "+441663362053")
	end

	def checkout
		send_text
		"Thank you! Your order was placed and will be delivered before #{@time.hour + 1}:#{@time.min}"
	end

	def text
		"\n Thank you! Your order was placed and will be delivered before #{@time.hour}:#{@time.min}.\n=================\nTotal cost £#{calc}"
	end


end