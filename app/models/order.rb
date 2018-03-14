class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products
  has_many :invoices, :dependent => :destroy
end