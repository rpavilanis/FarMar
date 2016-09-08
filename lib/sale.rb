require_relative "../far_mar.rb"
require 'date'

class FarMar::Sale

  attr_accessor :sales
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  # initializes sales_hash
    def initialize(sales_hash)
      @id = sales_hash[:id]
      @amount = sales_hash[:amount]
      @purchase_time = sales_hash[:purchase_time].to_datetime
      @vendor_id = sales_hash[:vendor_id]
      @product_id = sales_hash[:product_id]
    end

  # reads in CSV file
  # returns a collection of markets
  def self.all?

    sales = []
    sales_hash = {}

    CSV.open("./support/sales.csv", 'r').each do |line|
      sales_hash[:id] = line[0].to_i
      sales_hash[:amount] = line[1].to_i
      sales_hash[:purchase_time] = line[2]
      sales_hash[:vendor_id] = line[3].to_i
      sales_hash[:product_id] = line[4].to_i
      sales << FarMar::Sale.new(sales_hash)

    end

    return sales
  end

# returns an instance of object where value of id field in the CSV matches passed parameter
    def self.find(id_num)
      sales_array = FarMar::Sale.all?
      sales_array.each do |sale|
        if sale.id == id_num
          matching_sale = sale
          return matching_sale
        end
      end
    end

# returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
  def vendor
    vendor_array = FarMar::Vendor.all?
    vendor_array.each do |vendor|
      if vendor.id == vendor_id
        return vendor
      end
    end
  end

# returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
  def product
    product_array = FarMar::Product.all?
    product_array.each do |product|
      if product.id == product_id
        return product
      end
    end
  end

# returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
  def self.between(beginning_time, end_time)
    sales_array = FarMar::Sale.all?
    # date_from = Date.parse(beginning_time)
    # date_to = Date.parse(end_time)
    # date_range = date_from..date_to
    # date_range = end_time - beginning_time
    # sales_between = sales_array.map {|sale|  sale.purchase_time.include? date_range }
    #
    # return sales_between
    # need to use parse to correctly format dates
    sales_matching_time_range = []
    beginning_time = Date.new(beginning_time)
    end_time = Date.new(end_time)
    beginning_time = Date.parse()
    end_time = Date.parse()
    sales_array.each do |sale|
      if purchase_time >= Date.new(beginning_time) && purchase_time <= Date.new(end_time)
        sales_matching_time_range << sale
      end
    end
      return sales_matching_time_range

  end
end
