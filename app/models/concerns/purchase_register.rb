class PurchaseRegister
  class << self
    def new_purchase(params)
      purchaser = find_or_create_purchaser(params["purchaser_name"])
      merchant = find_or_create_merchant(params["merchant_name"], params["merchant_address"])
      item = find_or_create_item(params["item_description"], params["item_price"])

      Purchase.create({
        purchaser_id: purchaser.id, 
        merchant_id: merchant.id, 
        item_id: item.id,
        quantity: params["purchase_count"],
        total: total_purchase(item, params["purchase_count"])
      })
    end

    private

    def total_purchase(item, quantity)
      item.price * quantity.to_i
    end

    def find_or_create_purchaser(name)
      purchaser = Purchaser.find_by_name name
      purchaser ||= Purchaser.create name: name
      purchaser
    end

    def find_or_create_merchant(name, address)
      merchant = Merchant.find_by_name name
      merchant ||= Merchant.create name: name, address: address
      merchant
    end

    def find_or_create_item(description, price)
      item = Item.find_by_description description
      item ||= Item.create description: description, price: price
      item
    end
  end
end