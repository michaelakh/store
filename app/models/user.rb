class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :orders, :dependent => :destroy
  has_many :products, through: :orders
  
  #Validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :country
  validates_presence_of :postcode
  validates_uniqueness_of :postcode
  validates_uniqueness_of :email
  validates_presence_of :street_ad
  validates_presence_of :town_city
  validates_presence_of :phone_no
  
  def display_user
    [name, country, street_ad, phone_no].join " "
  end
end
