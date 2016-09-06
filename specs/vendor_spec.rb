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
    random_number = rand(1..500)
    FarMar::Vendor.find(random_number)
    expect(random_number).must_equal(@id =  random_number)
  end

# 3
  it "Makes sure that multiple instances of vendor are an array" do
    vendor1 = FarMar::Vendor.new({id: 501, name: "Rachel Pavilanis", num_employees: 1, market_id: 502})
    vendor2 = FarMar::Vendor.new({id: 502, name: "Matthew Pavilanis", num_employees: 1, market_id: 503})
    vendors_array = [vendor1, vendor2]
    expect(vendor1.class).must_equal(FarMar::Vendor)
    expect(vendors_array.class).must_equal(Array)
  end

end
