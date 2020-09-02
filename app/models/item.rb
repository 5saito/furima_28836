class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :items_purchase

  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :text, length: {maximum:1000}
    validates :price
    validates :category
    validates :image
    validates :prefecture
    validates :condition
    validates :user
    validates :days
    validates :delivery_fee
  end
end
