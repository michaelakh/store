class Invoice < ApplicationRecord
  belongs_to :address
  belongs_to :orders
end