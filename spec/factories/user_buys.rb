FactoryBot.define do
  factory :user_buy do
    user_id { 3 }
    item_id { 3 } 
    token { 'sample' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '大阪市北区' }
    address_number { '角田町1-1-1' }
    building_name { '第1ビル203' }
    phone_number { '09012345678' }
  end
end
