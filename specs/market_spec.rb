require_relative 'Spec_helper'
require_relative '../lib/market'

describe FarMar::Market do

#1
  it "Makes sure you can create an instance of market with various attributes" do
    market1 = FarMar::Market.new({id: 501, name_of_market: "Eugene Farmers Market", address: "1300 Oak Street", city: "Eugene", county: "Lane", state: "Oregon", zip: "97405"})
    expect(market1.id).must_equal(501)
    expect(market1.name_of_market).must_equal("Eugene Farmers Market")
    expect(market1.address).must_equal("1300 Oak Street")
    expect(market1.state).must_equal("Oregon")
    expect(market1.city).must_equal("Eugene")
    expect(market1.county).must_equal("Lane")
  end

#2
  it "Makes sure you can return appropriate market when given id" do
    FarMar::Market.markets
    random_number = rand(1..500)
    FarMar::Market.find(random_number)
    expect(random_number).must_equal(@id =  random_number)
  end

end

# check that class of my market is what I want it to be
# check random number from 1-500 rand(1..500)
