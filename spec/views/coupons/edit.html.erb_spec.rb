require 'rails_helper'

RSpec.describe "coupons/edit", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      :code => "MyString",
      :discount => 1.5,
      :valid => false
    ))
  end

  it "renders the edit coupon form" do
    render

    assert_select "form[action=?][method=?]", coupon_path(@coupon), "post" do

      assert_select "input[name=?]", "coupon[code]"

      assert_select "input[name=?]", "coupon[discount]"

      assert_select "input[name=?]", "coupon[valid]"
    end
  end
end
