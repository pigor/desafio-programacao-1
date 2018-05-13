require 'rails_helper'
RSpec.describe PurchaseParser, type: :model do
  it "parse file" do
    file_path = Rails.root.join('spec', 'support', 'example_input.tab')

    purchases = PurchaseParser.parse(file_path)
    
    expect(purchases.first.purchaser.name).to eq "João Silva"
    expect(purchases.first.item.price).to eq 10.0
    expect(purchases.first.merchant.name).to eq "Bob's Pizza"
  end
end
