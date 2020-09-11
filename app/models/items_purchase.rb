class ItemsPurchase < ApplicationRecord

  belongs_to :item
  has_one :purchase
  belongs_to :user

  with_options presence: true do
    validates :item
    validates :user
  end
end
