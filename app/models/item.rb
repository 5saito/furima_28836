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




end
