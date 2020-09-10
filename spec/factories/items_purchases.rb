FactoryBot.define do
  factory :items_purchase do
    post_cord = Faker::Name.post_cord(min_length: 8)
    city {Faker::Name.city}
    address {Faker::Name.address}
    phone_number = Faker::Name.phone_number(min_length: 11)
    prefecture_id {Faker::Name.prefecture_id}
    user_id {Faker::Name.user_id}
    item_id {Faker::Name.item_id}
  end
end
