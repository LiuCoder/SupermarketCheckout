#coding: utf-8
require 'spec_helper'

describe "products/index" do

  it "renders a list of products" do
    assign(:products, [
        stub_model(Product,
                   :product_code => "My Product Code",
                   :name => "My Name",
                   :price => "9.99"
        ),
        stub_model(Product,
                   :product_code => "My Product Code",
                   :name => "My Name",
                   :price => "9.99"
        )
    ])

    render

    assert_select "tr>td", :text => "My Product Code".to_s, :count => 2
    assert_select "tr>td", :text => "My Name".to_s, :count => 2
    assert_select "tr>td", :text => "£9.99".to_s, :count => 2
  end

  it "it formats product prices with 2 decimal places even when decimal values are zero" do
    assign(:products, [
        stub_model(Product,
                   :product_code => "My Product Code",
                   :name => "My Name",
                   :price => "9.00"
        )
    ])

    render

    assert_select "tr>td", :text => "My Product Code".to_s, :count => 1
    assert_select "tr>td", :text => "My Name".to_s, :count => 1
    assert_select "tr>td", :text => "£9.00".to_s, :count => 1
  end


end
