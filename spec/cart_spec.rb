require 'cart'

describe Cart do

	# allow(@client).to receive(account.messages.create).and_return (true)


	let(:user) {User.new}
	let(:menu) {Menu.new}
	let(:cart) {Cart.new}

	def add_two_pizzas
		user.add_to_cart(cart, menu, :pepperoni, 12)
		user.add_to_cart(cart, menu, :hawaii, 11)
	end

	it 'should be able to add an item to the cart' do
		add_two_pizzas
		expect(cart.cart.size).to eq(2)
	end

	it 'should be able to calculate total price of cart' do
		add_two_pizzas
		expect(cart.calc).to eq 23
	end

	it 'should output a message with time of delivery if the sum is correct' do
		add_two_pizzas
		time = Time.new
		expect(cart.checkout).to eq("Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}")
	end

	
end