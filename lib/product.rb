class Product
	attr_accessor :title, :price, :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products(options)
	end

	def self.all
		@@products
	end

	def self.find_by_title(title)
		@@products.find {|product| product.title == title}
	end

	def in_stock?
		self.stock > 0
	end

	def self.in_stock
		Product.all.select {|product| product.in_stock?}
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
