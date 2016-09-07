require_relative 'Spec_helper'
require_relative '../lib/vendor'

describe FarMar::Vendor do

#1
  it "Makes sure you can create an instance of vendor with various attributes" do
    vendor1 = FarMar::Vendor.new({id: 501, vendor_name: "Rachel Pavilanis", num_employees: 1, market_id: 502})
    expect(vendor1.id).must_equal(501)
    expect(vendor1.vendor_name).must_equal("Rachel Pavilanis")
    expect(vendor1.num_employees).must_equal(1)
    expect(vendor1.market_id).must_equal(502)
  end

#2
  it "Makes sure you can return appropriate vendor when given id" do
    FarMar::Vendor.all?
    random_number = rand(1..2690)
    FarMar::Vendor.find(random_number)
    expect(random_number).must_equal(@id =  random_number)
  end

# 3
  it "Makes sure that multiple instances of created vendors are stored in an array" do
    vendor1 = FarMar::Vendor.new({id: 501, name: "Rachel Pavilanis", num_employees: 1, market_id: 502})
    vendor2 = FarMar::Vendor.new({id: 502, name: "Matthew Pavilanis", num_employees: 1, market_id: 503})
    vendors_array = [vendor1, vendor2]
    expect(vendor1.class).must_equal(FarMar::Vendor)
    expect(vendors_array.class).must_equal(Array)
  end

# 4
  it "Makes sure that csv file you read in is appropriate length" do
    array = FarMar::Vendor.all?
    expect(array.length).must_equal(2690)
  end

#5
  it "Makes sure you can return appropriate number of vendors in an array when given a market id" do
    FarMar::Vendor.all?
    vendors_at_market = FarMar::Vendor.by_market(2)
    expect(vendors_at_market.class).must_equal(Array)
    expect(vendors_at_market.length).must_equal(3)
  end


end
