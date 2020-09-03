class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :user
  has_one :items_purchase



  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :text, length: {maximum:1000}
    validates :price
    validates :image
  end

 with_options numericality: { other_than: 1,message: "Select" } do
    validates :category
    validates :prefecture
    validates :condition
    validates :days
    validates :delivery_fee
 end

end
