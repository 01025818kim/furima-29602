class UserBuy
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :municipality, :address_number, :building_name, :phone_number
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }, length: { maximum: 11}
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address_number
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality:{ other_than: 0 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(buy_id: buy.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address_number: address_number, building_name: building_name, phone_number: phone_number)
  end
end