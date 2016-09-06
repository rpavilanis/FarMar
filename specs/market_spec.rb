require_relative 'Spec_helper'
require_relative '../lib/market'

describe FarMar::Market do

#
#1
  it 'Makes sure you can return appropriate market when given id' do
    FarMar::Market.all?
    expect(FarMar::Market.find(2)).must_equal({id: 2, name_of_market: "Silverdale Farmers Market", address: "98383", city: "Silverdale", county: "Kitsap", state: "Washington", zip: "98383"})
  end

end
