class Product < ApplicationRecord
  has_and_belongs_to_many :orders
  
   validates_presence_of :name
   validates_presence_of :price
   validates_presence_of :description
   validates_presence_of :category
end
