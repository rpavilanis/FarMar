require_relative "../far_mar.rb"

class FarMar::Product

attr_accessor :products
attr_reader :id, :product_name, :vendor_id

# initializes product_hash
  def initialize(product_hash)
    @id = product_hash[:id]
    @product_name = product_hash[:product_name]
    @vendor_id = product_hash[:vendor_id]
  end

# reads in CSV file
# returns a collection of markets
def self.all?

  products = []
  product_hash = {}

  CSV.open("./support/products.csv", 'r').each do |line|
    product_hash[:id] = line[0].to_i
    product_hash[:product_name] = line[1]
    product_hash[:vendor_id] = line[2].to_i
    products << FarMar::Product.new(product_hash)
  end

  return products
end

# returns an instance of object where value of id field in the CSV matches passed parameter
  def self.find(id_num)
    products_array = FarMar::Product.all?
    products_array.each do |product|
      if product.id == id_num
        matching_product = product
        return matching_product
      end
    end
  end

  def vendor
  end

  def sales
  end

  def number_of_sales
  end

# returns all of the products with the given vendor_id
  def self.by_vendor(vendor_id)
    matching_product_array = []
    product_array = FarMar::Product.all?
    product_array.each do |product|
      if product.vendor_id == vendor_id
        matching_product_array << product
      end
    end
    return matching_product_array
  end





end
