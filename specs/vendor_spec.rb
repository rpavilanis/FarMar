require_relative 'Spec_helper'
require_relative '../lib/vendor'

describe FarMar::Vendor do
  let (:vendor1){FarMar::Vendor.new({id: 7, vendor_name: "Rachel Pavilanis", num_employees: 1, market_id: 2})}
  let (:vendor2){FarMar::Vendor.new({id: 8, vendor_name: "Matthew Pavilanis", num_employees: 1, market_id: 2})}
  let (:vendor_all ) {FarMar::Vendor.all }
#1
  it "Makes sure you can create an instance of vendor with various attributes" do
    # vendor1 = FarMar::Vendor.new({id: 501, vendor_name: "Rachel Pavilanis", num_employees: 1, market_id: 502})
    expect(vendor1.id).must_equal(7)
    expect(vendor1.vendor_name).must_equal("Rachel Pavilanis")
    expect(vendor1.num_employees).must_equal(1)
    expect(vendor1.market_id).must_equal(2)
  end

#2
  it "Makes sure you can return appropriate vendor when given id" do
    random_number = rand(1..2690)
    FarMar::Vendor.find(random_number)
    expect(random_number).must_equal(@id =  random_number)
  end

# 3
  it "Makes sure that multiple instances of created vendors are stored in an array of appropriate length" do
    expect(vendor_all .class).must_equal(Array)
    expect(vendor_all .length).must_equal(2690)
  end

#4
  it "Makes sure you can return appropriate number of vendors in an array when given a market id" do
    vendors_at_market = FarMar::Vendor.by_market(2)
    expect(vendors_at_market.class).must_equal(Array)
    expect(vendors_at_market.length).must_equal(3)
  end

#5
  it "Market method finds the appropriate market's information for a given vendor" do
    market1 = vendor2.market
    expect(market1.name_of_market).must_equal("Silverdale Farmers Market")
  end

#6
  it "Products method returns a list of products sold by a specific vendor" do
    expect(vendor2.products.length).must_equal(4)
  end

#7
  it "Sales method returns a collection of FarMar::Sale instances that were made by a specific vendor" do
    expect(vendor1.sales.length).must_equal(7)
  end

#8
  it "Revenue method returns the the sum of all of a specific vendor's sales (in cents)" do
  expect(vendor2.revenue).must_equal(56038)
  end

end
