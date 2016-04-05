class Customer
	attr_accessor :name

	@@customers = []

	def initialize(options={})
		@name = options[:name]
		add_to_customers(options)
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.find {|customer| customer.name == name}
	end

	private
	def add_to_customers(options)
		if @@customers.any?{|customer| customer.name == options[:name]}
			raise DuplicateProductError, "'#{options[:name]}' already exists."
		else
			@@customers << self
		end
	end
end
