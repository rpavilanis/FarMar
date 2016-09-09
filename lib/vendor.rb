require_relative "../far_mar.rb"
require "date"

class FarMar::Vendor

attr_accessor :vendors
attr_reader :id, :vendor_name, :market_id, :num_employees

# initializes vendor_hash
  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @vendor_name = vendor_hash[:vendor_name]
    @num_employees = vendor_hash[:num_employees]
    @market_id = vendor_hash[:market_id]
  end

# reads in CSV file
# returns a collection of markets
def self.all

  vendor = []
  vendor_hash = {}

  CSV.open("./support/vendors.csv", 'r').each do |line|
    vendor_hash[:id] = line[0].to_i
    vendor_hash[:vendor_name] = line[1]
    vendor_hash[:num_employees] = line[2].to_i
    vendor_hash[:market_id] = line[3].to_i
    vendor << FarMar::Vendor.new(vendor_hash)
  end

  return vendor
end

# returns an instance of object where value of id field in the CSV matches passed parameter
  def self.find(id_num)
    matching_vendor = []
    vendor_array = FarMar::Vendor.all
    vendor_array.each do |vendor|
      if vendor.id == id_num
        matching_vendor = vendor
      end
    end
    return matching_vendor
  end

# matches the FarMar::Vendor market_id field with appropriate id in FarMar::Market
  def market
    market_array = FarMar::Market.all
    market_array.each do |market|
      if market.id == market_id
        return market
      end
    end
  end

# returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  def products
    FarMar::Product.by_vendor(id)
  end

# returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  def sales
    matching_sales_array = []
    sales_array = FarMar::Sale.all
    sales_array.each do |sale|
      if sale.vendor_id == id
        matching_sales_array << sale
      end
    end
    return matching_sales_array
  end

# returns the the sum of all of the vendor's sales (in cents)
# if given a date, returns the total revenue for that specific purchase time and vendor instance
  def revenue(date = nil)
    if date == nil
      total_vendor_sales = 0
      sales.each do |sale|
        total_vendor_sales += sale.amount
      end
      return total_vendor_sales
    else
      total_vendor_sales_on_date = 0

      sales.each do |sale|
        # date = DateTime.strptime(date, "%Y-%m-%d %H:%M:%S")
        # if date >= purchase_time_begin && date <= purchase_time_end
        purchase_time = DateTime.parse(sale.purchase_time)
        if date === purchase_time
          total_vendor_sales_on_date += sale.amount
        end
      end
      return total_vendor_sales_on_date
    end
  end

# returns all of the vendors with the given market_id
  def self.by_market(market_id)
    matching_vendor_array = []
    vendor_array = FarMar::Vendor.all
    vendor_array.each do |vendor|
      if vendor.market_id == market_id
        matching_vendor_array << vendor
      end
    end
    return matching_vendor_array
  end

end
