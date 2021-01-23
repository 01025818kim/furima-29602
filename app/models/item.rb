class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipment
  
  with_options presence: true do
    validates :image
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '商品名(必須40文字まで)'}, length: { maximum: 40}
    validates :comment, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '商品の説明(必須1,000文字まで)'}, length: { maximum: 1000}
    validates :price, numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
  end
    
  with_options numericality:{ other_than: 0 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipment_id
  end
end
