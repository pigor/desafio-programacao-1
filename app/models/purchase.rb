class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant

  validates :purchaser_id, :merchant_id, :item_id, :quantity, :total, presence: true
end
