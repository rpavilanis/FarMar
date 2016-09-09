require_relative "../far_mar.rb"

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
  def revenue
    total_vendor_sales = 0
    sales.each do |sale|
      total_vendor_sales += sale.amount
    end
    return total_vendor_sales
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

# returns the top n vendor instances ranked by total revenue
  # def self.most_revenue(n)
  #
  #
  # end

# returns the total revenue for that specific purchase time and vendor instance
  def revenue(date)
    total_vendor_sales_on_date = 0
    vendor_sales = self.sales
    vendor_sales.each do |vendor|
      if date === vendor.purchase_time
        total_vendor_sales_on_date += vendor.amount
      end
    end
    return total_vendor_sales_on_date
  end

# returns the total revenue for that date across all vendors
  # def self.revenue(date)
  #
  #
  # end

end
