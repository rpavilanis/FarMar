require_relative "../far_mar.rb"

class FarMar::Sale

  attr_accessor :sales
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  # initializes sales_hash
    def initialize(sales_hash)
      @id = sales_hash[:id]
      @amount = sales_hash[:amount]
      @purchase_time = sales_hash[:purchase_time]
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
  end

  def self.between(beginning_time, end_time)
  end



end
