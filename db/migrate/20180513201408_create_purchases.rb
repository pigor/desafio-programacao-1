class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.belongs_to :purchaser, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.integer :quantity
      t.belongs_to :merchant, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
