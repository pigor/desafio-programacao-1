class PurchaseRegister
  class << self
    def new_purchase(params)
      purchaser = Purchaser.find_or_create_purchaser(params["purchaser_name"])
      merchant = Merchant.find_or_create_merchant(params["merchant_name"], params["merchant_address"])
      item = Item.find_or_create_item(params["item_description"], params["item_price"])

      Purchase.create({
        purchaser_id: purchaser.id, 
        merchant_id: merchant.id, 
        item_id: item.id,
        quantity: params["purchase_count"],
        total: item.total_purchase(params["purchase_count"])
      })
    end
  end
end