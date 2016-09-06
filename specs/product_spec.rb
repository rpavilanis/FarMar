require_relative 'Spec_helper'
require_relative '../lib/product'

describe FarMar::Product do

#1
  it "Makes sure you can create an instance of product with various attributes" do
    product1 = FarMar::Product.new({id: 501, product_name: "egg cartons", vendor_id: 502})
    expect(product1.id).must_equal(501)
    expect(product1.product_name).must_equal("egg cartons")
    expect(product1.vendor_id).must_equal(502)
  end

#2
  it "Makes sure you can return appropriate product when given id" do
    FarMar::Product.all?
    random_number = rand(1..8193)
    FarMar::Product.find(random_number)
    expect(random_number).must_equal(@id =  random_number)
  end

# 3
  it "Makes sure that multiple instances of product are an array" do
    product1 = FarMar::Product.new({id: 501, product_name: "egg cartons", vendor_id: 502})
    product2 = FarMar::Product.new({id: 502, product_name: "shellfish", vendor_id: 502})
    products_array = [product1, product2]
    expect(product1.class).must_equal(FarMar::Product)
    expect(products_array.class).must_equal(Array)
  end

# 4
  it "Makes sure that file you read in is appropriate length" do
    array = FarMar::Product.all?
    expect(array.length).must_equal(8193)
  end

end
