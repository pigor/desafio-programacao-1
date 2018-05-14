require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it '#register' do
    purchase_params = {
      "purchaser_name" => 'João Silva',
      "item_description" => 'R$10 off R$20 of food',
      "item_price" => 10.0,
      "purchase_count" =>	2,
      "merchant_address" =>	'987 Fake St',
      "merchant_name" => "Bob's Pizza"
    }

    purchase = PurchaseRegister.new_purchase(purchase_params)

    expect(purchase.quantity).to eq 2
    expect(purchase.total).to eq 20.0
    expect(purchase.item.description).to eq purchase_params["item_description"]
    expect(purchase.purchaser.name).to eq purchase_params["purchaser_name"]
    expect(purchase.merchant.name).to eq purchase_params["merchant_name"]
  end
end