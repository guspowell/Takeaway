class Menu

	attr_reader :dishes

	def initialize
		@dishes = {
			pepperoni: 12,
			hawaii: 11,
			bbq_chicken: 11,
			margherita: 9
		}	
	end

	def add_dish (pizza, price)
		raise 'pizza already exists on the menu' if dishes.has_key?(pizza.to_sym)
		dishes[pizza.to_sym] = price
	end

	def remove_dish (pizza, price)
		raise 'pizza not on the menu' unless dishes.has_key?(pizza.to_sym)
		dishes.delete(pizza)
	end

	end
	
	# make dish class