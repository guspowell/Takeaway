require 'user'

describe User do

	let(:user) {User.new}
	let(:menu) {Menu.new}
	let(:cart) {Cart.new}


	def add_two_pizzas
		user.add_to_cart(cart, menu, :pepperoni, 12)
		user.add_to_cart(cart, menu, :hawaii, 11)
	end

	it 'should be able to add an item to the cart' do
		user.add_to_cart(cart, menu, 'pepperoni', 12)
		expect(cart.cart.size).to eq(1)
	end

	it 'should raise an error if adding a dish that doesn\'t exist' do
		expect( lambda {user.add_to_cart(cart, menu, 'banana', 12)}).to raise_error(RuntimeError, "dish not on the menu")
	end

	it 'should raise an error if price does not match dish' do
		expect( lambda {user.add_to_cart(cart, menu, :pepperoni, 10)}).to raise_error(RuntimeError, "incorrect price")	
	end

	it 'should raise an error if price given does not eq total price upon placing order' do
		add_two_pizzas
		expect( lambda {user.place_order(cart, 10)}).to raise_error(RuntimeError, "incorrect total price")
	end

end