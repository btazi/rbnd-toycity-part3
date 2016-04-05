class Transaction
	attr_accessor :id, :customer, :product

	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		add_to_transactions
	end

	def self.all
		@@transactions
	end

	def self.find(id)
		Transaction.all.find { |transaction| transaction.id == id }
	end

	private
	
	def add_to_transactions
		if product.stock > 0
			@@transactions << self
			@id = @@transactions.count
			product.stock -= 1
		else
			raise OutOfStockError, "'#{product.title}' is out of stock."
		end
	end
end
