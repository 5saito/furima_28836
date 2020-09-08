class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string        :post_cord    , null: false
      t.string        :city         , null: false
      t.string        :address      , null: false
      t.string        :room_number  , null: false
      t.integer       :prefecture   , null: false
      t.references    :items_purchase , null: false, foreign_key: true
      t.timestamps
    end
  end
end
