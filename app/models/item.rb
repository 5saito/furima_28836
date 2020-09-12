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
    validates :name
    validates :text
    validates :price
    validates :category_id,  numericality: { other_than: 1} 
    validates :image
    validates :condition_id,  numericality: { other_than: 1} 
    validates :prefecture_id,  numericality: { other_than: 1} 
    validates :days_id,  numericality: { other_than: 1} 
    validates :delivery_fee_id,  numericality: { other_than: 1} 
 end
end
