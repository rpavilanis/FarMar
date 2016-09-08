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

# returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
  def vendor
    vendor_array = FarMar::Vendor.all?
    vendor_array.each do |vendor|
      if vendor.id == vendor_id
        return vendor
      end
    end
  end

# returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
  def sales
    matching_sales_array = []
    sales_array = FarMar::Sale.all?
    sales_array.each do |sale|
      if sale.product_id == id
        matching_sales_array << sale
      end
    end
    return matching_sales_array
  end

# returns the number of times this product has been sold.
  def number_of_sales
    total_sales = 0
    sales.each do |sale|
      total_sales += 1
    end
    return total_sales
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
