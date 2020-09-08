class ItemPurchase

  include ActiveModel::Model
  attr_accessor :name, :text, :price, :image, :post_cord, :prefecture, :city, :address, :room_number, :phone_number, :item_purchase


  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :text, length: {maximum:1000}
    validates :price
    validates :image
  end

 with_options numericality: { other_than: 1,message: "Select" } do
    validates :category_id
    validates :prefecture_id
    validates :condition_id
    validates :days_id
    validates :delivery_fee_id
 end

 with_options presence: true do
  validates :post_cord
  validates :prefecture
  validates :city
  validates :address
  validates :room_number
  validates :phone_number
  validates :items_purchase
end
def save
  items = Item.create(name: name, text: text, price: price, image: image, )

  Address.create(post_cord: post_cord, prefecture: prefecture, city: city, address: address, room_number: room_number, 
  phone_number: phone_number, user_id: user.id)

  ItemsPurchase.create(item_id: item.id, user_id: user.id)
end
end