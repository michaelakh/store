class Product < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  
  has_many :product_infos, :dependent => :destroy
  has_many :p_reviews, :dependent => :destroy
  accepts_nested_attributes_for :product_infos
  has_and_belongs_to_many :orders
  
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :description
  validates_presence_of :category
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/bitmap']
end
