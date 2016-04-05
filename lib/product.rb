class Product
	attr_accessor :title, :price, :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		add_to_products(options)
	end

	def self.all
		@@products
	end

	private

	def add_to_products(options)
		if @@products.any?{|product| product.title == options[:title]}
			raise DuplicateProductError, "'#{options[:title]}' already exists."
		else
			@@products << self
		end
	end
end
