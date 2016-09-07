require_relative 'Spec_helper'
require_relative '../lib/sale'

describe FarMar::Sale do

#1
  it "Makes sure you can create an instance of sale with various attributes" do
    sale1 = FarMar::Sale.new({id: 2000, amount: 25.10, vendor_id: 502, product_id: 300})
    expect(sale1.id).must_equal(2000)
    expect(sale1.vendor_id).must_equal(502)
    expect(sale1.product_id).must_equal(300)
  end

#2
  it "Makes sure you can return appropriate sale when given id" do
    FarMar::Sale.all?
    random_number = rand(1..12798)
    FarMar::Sale.find(random_number)
    expect(random_number).must_equal(@id = random_number)
  end

# 3
  it "Makes sure that multiple instances of sale are an array" do
    sale1 = FarMar::Sale.new({id: 2000, amount: 25.10, vendor_id: 502, product_id: 300})
    sale2 = FarMar::Sale.new({id: 2000, amount: 25.10, vendor_id: 502, product_id: 300})
    sales_array = [sale1, sale2]
    expect(sale1.class).must_equal(FarMar::Sale)
    expect(sales_array.class).must_equal(Array)
  end

# 4
  it "Makes sure that file you read in is appropriate length" do
    array = FarMar::Sale.all?
    expect(array.length).must_equal(12798)
  end

#5
  it "Vendor method finds the appropriate vendor's information for a given sale" do
    sale1 = FarMar::Sale.new({id: 2000, amount: 25.10, vendor_id: 10, product_id: 300})
    vendor1 = sale1.vendor
    expect(vendor1.vendor_name).must_equal("Kertzmann LLC")
  end

end
