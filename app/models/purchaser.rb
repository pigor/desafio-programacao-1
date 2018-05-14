class Purchaser < ApplicationRecord
  has_many :purchases
  
  validates :name, presence: true

  def self.find_or_create_purchaser(name)
    purchaser = Purchaser.find_by_name name
    purchaser ||= Purchaser.create name: name
    purchaser
  end
end
