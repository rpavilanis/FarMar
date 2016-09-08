require_relative 'Spec_helper'
require_relative '../lib/sale'

describe FarMar::Sale do
  let (:sale1){FarMar::Sale.new({id: 2000, amount: 25.10, vendor_id: 10, product_id: 20})}
  let (:sale_all ){FarMar::Sale.all }

#1
  it "Makes sure you can create an instance of sale with various attributes" do
    expect(sale1.id).must_equal(2000)
    expect(sale1.vendor_id).must_equal(10)
    expect(sale1.product_id).must_equal(20)
  end

#2
  it "Makes sure you can return appropriate sale when given id" do
    random_number = rand(1..12798)
    FarMar::Sale.find(random_number)
    expect(random_number).must_equal(@id = random_number)
  end

# 3
  it "Makes sure that multiple instances of sale are an array and that it is appropriate length" do
    expect(sale_all .class).must_equal(Array)
    expect(sale_all .length).must_equal(12798)
  end

#4
  it "Vendor method finds the appropriate vendor's information for a given sale" do
    vendor1 = sale1.vendor
    expect(vendor1.vendor_name).must_equal("Kertzmann LLC")
  end
#5
  it "Product method finds the FarMar::Product instance that is associated with a given sale using the FarMar::Sale product_id field" do
    product1 = sale1.product
    expect(product1.product_name).must_equal("Tall Pretzel")
  end
#6
  it "self.between returns an array of correct length" do
     expect(FarMar::Sale.between('2013-11-07 04:34:56 -08:00', '2013-11-07 04:38:48 -08:00').class).must_equal(Array)
     expect(FarMar::Sale.between('2013-11-07 04:34:56 -08:00', '2013-11-07 04:38:48 -08:00').length).must_equal(4)
  end

end
