FactoryBot.define do
  factory :item do
    name         {"テスト"}
    comment      {"テスト商品の説明"}
    category_id     { 2 }
    state_id        { 2 }
    delivery_fee_id { 2 }
    prefecture_id   { 2 }
    shipment_id     { 2 }
    price        {'300'}
    association  :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/koinu.jpg'),filename: 'koinu.jpg')
    end
  end
end

