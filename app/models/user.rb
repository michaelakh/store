class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :orders, :dependent => :destroy
  has_many :products, through: :orders
  
  #Sign up Validations
  #validates_presence_of :first_name
  #validates_presence_of :last_name
  #validates_presence_of :email
  #validates_uniqueness_of :email
  
  #Payment Validation
  validates_presence_of :country, on: :create_customer
  validates_presence_of :postcode, on: :create_customer
  validates_uniqueness_of :postcode, on: :create_customer
  validates_presence_of :street_ad, on: :create_customer
  validates_presence_of :town_city, on: :create_customer
  validates_presence_of :phone_no, on: :create_customer
  
  def display_user
    [name, country, street_ad, phone_no].join " "
  end
end
