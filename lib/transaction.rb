class Transaction
	attr_accessor :id, :customer, :product, :amount

	@@transactions = []

	def initialize(customer, product, amount=1)
		@customer = customer
		@product = product
		@amount = amount
		add_to_transactions(amount)
	end

	def self.all
		@@transactions
	end

	def self.find(id)
		Transaction.all.find { |transaction| transaction.id == id }
	end

	def self.find_by_product(product)
		Transaction.all.select { |transaction| transaction.product == product }
	end

	private
	
	def add_to_transactions(amount)
		if product.stock - amount > 0
			@@transactions << self
			@id = @@transactions.count
			product.stock -= amount 
		else
			raise OutOfStockError, "'#{product.title}' is out of stock."
		end
	end
end
