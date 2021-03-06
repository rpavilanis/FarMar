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
  def self.all

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
    market_array = FarMar::Market.all
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
    market_array = FarMar::Market.all
    market_array.each do |market|
      if market.name_of_market.include? search_term.to_s
        matching_markets << market
      end
    end
    return matching_markets
  end

  # returns vendor with highest revenue
  # returns the vendor with the highest revenue for the given date
  def preferred_vendor(date = nil)
    highest_selling_vendor_amount = 0
    highest_selling_vendor = ""
    if date == nil
      vendors.each do |vendor|
        if vendor.revenue > highest_selling_vendor_amount
          highest_selling_vendor_amount = vendor.revenue
          highest_selling_vendor = vendor
        end
      end
      return highest_selling_vendor
    # else
    #   sales = FarMar::Sale.between("#{date} 00:00:00", "#{date} 24:59:59")
    #   # sales = FarMar::Sale.all
    #   sales.each do |sale|
    #     # purchase_time = DateTime.parse(sale.purchase_time)
    #     vendors.each do |vendor|
    #       # if purchase_time === date
    #         if vendor.revenue > highest_selling_vendor_amount
    #           highest_selling_vendor_amount = vendor.revenue
    #           highest_selling_vendor = vendor
    #         end
    #       end
    #     end
    #   # end
    #     return highest_selling_vendor
    end
  end

    # returns vendor with worst revenue
    def worst_vendor(date = nil) # google optional argument (split up into other methods to call inside here)
      lowest_selling_vendor_amount = 1000000000000000 #I know there must be a better way to do this lol
      lowest_selling_vendor = ""
      vendors.each do |vendor|
        if vendor.revenue < lowest_selling_vendor_amount
          lowest_selling_vendor_amount = vendor.revenue
          lowest_selling_vendor = vendor
        end
      end
      return lowest_selling_vendor
    end


end
