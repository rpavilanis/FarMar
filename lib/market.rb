require_relative '../far_mar.rb'


class FarMar::Market

attr_accessor :markets
attr_reader :id, :name_of_market, :address, :city, :county, :state, :zip

# initializes market_hash
  def initialize(market_hash)
    @id = market_hash[:id]
    @name_of_market = market_hash[:name_of_market]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

# reads in CSV file
# returns a collection of markets
def self.all?

  markets = []
  market_hash = {}

  CSV.open("./support/markets.csv", 'r').each do |line|
    market_hash[:id] = line[0].to_i
    market_hash[:name_of_market] = line[1]
    market_hash[:address] = line[2]
    market_hash[:city] = line[3]
    market_hash[:county] = line[4]
    market_hash[:state] = line[5]
    market_hash[:zip] = line[6]
    markets << FarMar::Market.new(market_hash)
  end

  return markets
end

# returns an instance of object where value of id field in the CSV matches passed parameter
  def self.find(id_num)
    matching_market = []
    market_array = FarMar::Market.all?
    market_array.each do |market|
      if market.id == id_num
        matching_market = market
      end
    end
   return matching_market
  end

# find the vendors that sell at a specific market
  def vendors
    FarMar::Vendor.by_market(id)
  end

# OPTIONAL: products returns a collection of FarMar::Product instances that are associated to the market through the FarMar::Vendor class.
  def products
    products_at_market = []
    vendors_at_market = self.vendors
    vendors_at_market.each do |vendor|
        products_at_market << vendor.products
    end
    return products_at_market.flatten
  end

# OPTIONAL: self.search(search_term) returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
  def self.search(search_term)
    matching_markets = []
    market_array = FarMar::Market.all?
    market_array.each do |market|
      if market.name_of_market.include? search_term.to_s
        matching_markets << market
      end
    end
   return matching_markets

  end

end
