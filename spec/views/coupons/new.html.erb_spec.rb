require 'rails_helper'

RSpec.describe "coupons/new", type: :view do
  before(:each) do
    assign(:coupon, Coupon.new(
      :code => "MyString",
      :discount => 1.5,
      :valid => false
    ))
  end

  it "renders new coupon form" do
    render

    assert_select "form[action=?][method=?]", coupons_path, "post" do

      assert_select "input[name=?]", "coupon[code]"

      assert_select "input[name=?]", "coupon[discount]"

      assert_select "input[name=?]", "coupon[valid]"
    end
  end
end
