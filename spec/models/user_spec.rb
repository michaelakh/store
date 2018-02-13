require 'rails_helper'

RSpec.describe User, :type => :model do
  
  before(:all) do
    @user1 = create(:user, postcode:'loollo')
    @user2 = create(:user, postcode:'looolo', email:"bob@gmail.com", first_name:'Bob')
  end
  
  after(:all) do
    User.delete_all
  end
  
  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end
  
  it "has a unique email" do
    user2 = build(:user, email: "bob@gmail.com")
    expect(user2).to_not be_valid
  end
  
  it "is not valid without a password" do 
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without a last name" do 
    user2 = build(:user, last_name: nil)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end
end
