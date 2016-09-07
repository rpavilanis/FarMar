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

#5
  it "Makes sure you can return appropriate number of products in an array when given a product id" do
    FarMar::Product.all?
    products_by_vendor = FarMar::Product.by_vendor(4)
    expect(products_by_vendor.class).must_equal(Array)
    expect(products_by_vendor.length).must_equal(3)
  end

#6
  it "Vendor method finds the appropriate vendor's information for a given product" do
    product1 = FarMar::Product.new({id: 501, product_name: "egg cartons", vendor_id: 8})
    vendor1 = product1.vendor
    expect(vendor1.vendor_name).must_equal("Stamm Inc")
  end

#7
  it "Sales method returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field." do
    product1 = FarMar::Product.new({id: 9, product_name: "egg cartons", vendor_id: 8})
    product_sales_array = product1.sales
    expect(product_sales_array.length).must_equal(3)
  end


end
