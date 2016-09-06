require_relative '../far_mar.rb'


class FarMar::Market

attr_accessor
attr_reader

  def initialize(market_hash)
    @id = market_hash[:id]
    @name_of_market = market_hash[:name_of_market]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]

  end

# returns a collection of markets
  def self.all?
    @@markets = []
    market_hash = {}

    CSV.open("support/markets.csv", 'r').each do |line|
      market_hash[:id] = line[0].to_i
      market_hash[:name_of_market] = line[1]
      market_hash[:address] = line[2]
      market_hash[:city] = line[3]
      market_hash[:county] = line[4]
      market_hash[:state] = line[5]
      market_hash[:zip] = line[6]
      @@markets << FarMar::Market.new(market_hash)
    end

    return ap @@markets
  end

# returns an instance of object where value of id field in the CSV matches passed parameter
  def self.find(id)
    # Sample code to use from BankAccount
    #  @@users.each do |user|
    #   if user.owner_ID == id_number
    #     matching_account = user
    #     puts "That matches an ID in our system. Here is your account information."
    #     return ap matching_account
    #   end
    # end
    # puts "That ID does not match any users in our system."
  end

  def vendors
  end




end
