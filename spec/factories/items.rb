FactoryBot.define do
  factory :item do
    name   {Faker::Name.name(max_length: 40)}
    text   {Faker::Name.name(max_length: 1000)}
    price  {Faker::Name.price}
    category {Faker::Name.category}
    image {Faker::Name.image}
    prefecture {Faker::Name.prefecture}
    condition {Faker::Name.condition}
    user {Faker::Name.user}
    days {Faker::Name.days}
    delivery_fee {Faker::Name.delivery_fee}
  end
end
