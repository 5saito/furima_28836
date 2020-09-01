class Item < ApplicationRecord
  belongs_to :user
  has_one :items_purchase

  with_options presence: true do
    validates :name
    validates :text
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
