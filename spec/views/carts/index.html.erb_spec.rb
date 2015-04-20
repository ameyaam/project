require 'rails_helper'

RSpec.describe "carts/index", :type => :view do
  before(:each) do
    assign(:carts, [
      Cart.create!(
        :user => nil,
        :Product => "",
        :FarmersMarket => "",
        :quantity => 1
      ),
      Cart.create!(
        :user => nil,
        :Product => "",
        :FarmersMarket => "",
        :quantity => 1
      )
    ])
  end

  it "renders a list of carts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
