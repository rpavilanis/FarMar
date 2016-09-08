require_relative 'Spec_helper'
require_relative '../lib/product'

describe FarMar::Product do
  let (:product1){FarMar::Product.new({id: 9, product_name: "egg cartons", vendor_id: 8})}
  let (:product2){FarMar::Product.new({id: 14, product_name: "decorative clocks", vendor_id: 8})}
  let (:product_all?){FarMar::Product.all?}

#1
  it "Makes sure you can create an instance of product with various attributes" do
    expect(product1.id).must_equal(9)
    expect(product1.product_name).must_equal("egg cartons")
    expect(product1.vendor_id).must_equal(8)
  end

#2
  it "Makes sure you can return appropriate product when given id" do
    random_number = rand(1..8193)
    FarMar::Product.find(random_number)
    expect(random_number).must_equal(@id =  random_number)
  end

# 3
  it "Makes sure that multiple instances of product are an array and file you read in is appropriate length" do
    expect(product_all?.class).must_equal(Array)
    expect(product_all?.length).must_equal(8193)
  end

#4
  it "Makes sure you can return appropriate number of products in an array when given a product id" do
    products_by_vendor = FarMar::Product.by_vendor(4)
    expect(products_by_vendor.class).must_equal(Array)
    expect(products_by_vendor.length).must_equal(3)
  end

#5
  it "Vendor method finds the appropriate vendor's information for a given product" do
    product1 = FarMar::Product.new({id: 501, product_name: "egg cartons", vendor_id: 8})
    vendor1 = product1.vendor
    expect(vendor1.vendor_name).must_equal("Stamm Inc")
  end

#6
  it "Sales method returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field." do
    expect(product1.sales.length).must_equal(3)
  end

#7
  it "Number_of_sales method returns the number of sales made of a specific product" do
    expect(product2.number_of_sales).must_equal(7)
  end

end
