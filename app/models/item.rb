class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :days
  belongs_to_active_hash :delivery_fee

  belongs_to :user
  has_one :items_purchase
  has_one_attached :image


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

end
