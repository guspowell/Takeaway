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

	it 'should be able to calculate total price of cart' do
		user.add_to_cart(menu, :pepperoni, 12)
		user.add_to_cart(menu, :hawaii, 11)
		expect(user.calc).to eq 23
	end

	it 'should raise an error if price given does not eq total price' do
		user.add_to_cart(menu, :pepperoni, 12)
		user.add_to_cart(menu, :hawaii, 11)
		expect( lambda {user.checkout(10)}).to raise_error(RuntimeError, "incorrect total price")
	end

	it 'should output a message with time of deliveryif the sum is correct' do
		user.add_to_cart(menu, :pepperoni, 12)
		user.add_to_cart(menu, :hawaii, 11)
		time = Time.new
		expect(user.checkout(23)).to eq("Thank you! Your order was placed and will be delivered before #{time.hour}:#{time.min}")
	end

	it 'should send a text to the user when checking out' do

	end

end