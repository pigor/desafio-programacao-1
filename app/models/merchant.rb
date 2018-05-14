class Merchant < ApplicationRecord
  has_many :purchases

  validates :name, :address, presence: true

  def self.find_or_create_merchant(name, address)
    merchant = Merchant.find_by_name name
    merchant ||= Merchant.create name: name, address: address
    merchant
  end
end
