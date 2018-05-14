class Item < ApplicationRecord
  has_many :purchases

  validates :description, :price, presence: true
  validates :description, uniqueness: true

  def self.find_or_create_item(description, price)
    item = Item.find_by_description description
    item ||= Item.create description: description, price: price
    item
  end

  def total_purchase(quantity)
    price * quantity.to_i
  end
end