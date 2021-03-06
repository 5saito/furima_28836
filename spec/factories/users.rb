FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    family_name {Faker::Name.family_name}
    first_name {Faker::Name.first_name}
    family_name_kana {Faker::Name.family_name_kana}
    first_name_kana {Faker::Name.first_name_kana}
    birth_day {Faker::date.birth_day(min_age: 18, max_age: 65)}
  end
end