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
def self.all?

  @@vendors = []
  vendor_hash = {}

  CSV.open("./support/vendors.csv", 'r').each do |line|
    vendor_hash[:id] = line[0].to_i
    vendor_hash[:vendor_name] = line[1]
    vendor_hash[:num_employees] = line[2]
    vendor_hash[:market_id] = line[3]
    @@vendors << FarMar::Vendor.new(vendor_hash)

    return @@vendors
  end
end

# returns an instance of object where value of id field in the CSV matches passed parameter
  def self.find(id_num)
    @@vendors.each do |vendor|
      if vendor.id == id_num
        matching_vendor = market
        return matching_vendor
      end
    end
  end

  def market
  end

  def products
  end

  def sales
  end

  def revenue
  end

  def self.by_market(market_id)
  end





end