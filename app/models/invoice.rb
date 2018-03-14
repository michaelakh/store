class Invoice < ApplicationRecord
  belongs_to :address
  belong_to :orders
end