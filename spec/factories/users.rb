FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"テスト"}
    last_name             {"太郎"}
    first_furigana        {"テスト"}
    last_furigana         {"タロウ"}
    birthday              {Faker::Date.birthday}
  end
end