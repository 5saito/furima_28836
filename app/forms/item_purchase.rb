class ItemPurchase

  include ActiveModel::Model
  attr_accessor :post_cord, :prefecture_id, :city, :address, :room_number, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :post_cord, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end


  def save
    items_purchase = ItemsPurchase.create(item_id: item_id, user_id: user_id)
    Purchase.create(post_cord: post_cord, prefecture: prefecture_id, city: city, address: address, room_number: room_number,
    phone_number: phone_number, items_purchase_id: items_purchase.id)
  end
end