require 'menu'

describe Menu do

	let (:menu) {Menu.new}

	it 'should be able to add dishes to the menu' do
		menu.add_dish('capricciosa', 12)
		expect(menu.dishes.has_key?(:capricciosa)).to eq true
	end

	it 'raise an error if pizza already exists' do
		expect( lambda {menu.add_dish(:pepperoni, 12)}).to raise_error(RuntimeError, 'pizza already exists on the menu')
	end

	it 'should be able to remove dishes from the menu' do
		menu.remove_dish(:pepperoni, 12)
		expect(menu.dishes.has_key?(:pepperoni)).to eq false
	end

	it 'raise an error if pizza not on menu' do
		expect( lambda {menu.remove_dish(:meat_feast, 14)}).to raise_error(RuntimeError, 'pizza not on the menu')
	end


end