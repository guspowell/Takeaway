require 'user'

describe User do

	let(:user) {User.new}
	let(:menu) {Menu.new}

	it 'should be able to read the menu' do
	end

	it 'should be able to add an item to the cart' do
		user.add_to_cart(menu, 'pepperoni', 12)
		expect(user.cart[0][:dish]).to eq(:pepperoni)
		expect(user.cart[0][:price]).to eq(12)
	end

	it 'should raise an error if adding a dish that doesn\'t exist' do
		expect( lambda {user.add_to_cart(menu, 'banana', 12)}).to raise_error(RuntimeError, "dish not on the menu")
	end

	it 'should raise an error if price does not match dish' do
		expect( lambda {user.add_to_cart(menu, :pepperoni, 10)}).to raise_error(RuntimeError, "incorrect price")	
	end

end