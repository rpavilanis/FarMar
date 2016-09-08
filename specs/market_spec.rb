require_relative 'Spec_helper'
require_relative '../lib/market'

describe FarMar::Market do

  let (:market1){
    FarMar::Market.new({id: 1, name_of_market: "Eugene Farmers Market", address: "1300 Oak Street", city: "Eugene", county: "Lane", state: "Oregon", zip: "97405"})
  }
  let (:market2){
    FarMar::Market.new({id: 502, name_of_market: "Corvallis Farmers Market", address: "1300 Oak Street", city: "Corvallis", county: "Lane", state: "Oregon", zip: "97405"})
  }
  let (:market_all?) {FarMar::Market.all?}

#1
  it "Makes sure you can create an instance of market with various attributes" do
    expect(market1.id).must_equal(1)
    expect(market1.name_of_market).must_equal("Eugene Farmers Market")
    expect(market1.address).must_equal("1300 Oak Street")
    expect(market1.state).must_equal("Oregon")
    expect(market1.city).must_equal("Eugene")
    expect(market1.county).must_equal("Lane")
  end

#2
  it "Makes sure you can return appropriate market when given id" do
    random_number = rand(1..500)
    FarMar::Market.find(random_number)
    expect(random_number).must_equal(@id =  random_number)
  end

# 3
  it "Makes sure that file you read in is appropriate length, and that it is an array" do
    markets_array = market_all?
    expect(markets_array.class).must_equal(Array)
    expect(markets_array.length).must_equal(500)
  end

#4
  it "Vendor method returns a list of vendors with market ID" do
    vendors_array = []
    vendors_array = market1.vendors
    expect(vendors_array.length).must_equal(6)
  end

end
