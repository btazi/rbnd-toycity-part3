class Transaction
	attr_accessor :id, :customer, :product

	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		add_to_transactions
		@id = @@transactions.count
		product.stock -= 1
	end

	private
	
	def add_to_transactions
		@@transactions << self
	end
end
