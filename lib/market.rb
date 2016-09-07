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

end
