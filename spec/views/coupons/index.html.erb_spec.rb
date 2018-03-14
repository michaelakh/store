require 'rails_helper'

RSpec.describe "coupons/index", type: :view do
  before(:each) do
    assign(:coupons, [
      Coupon.create!(
        :code => "Code",
        :discount => 2.5,
        :valid => false
      ),
      Coupon.create!(
        :code => "Code",
        :discount => 2.5,
        :valid => false
      )
    ])
  end

  it "renders a list of coupons" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
