class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
  validates :nickname
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])+\z/
  validates :password, length: { minimum: 6 } confirmation: true, format: { with: VALID_PASSWORD_REGEX}
  validates :first_name
  validates :last_name
  validates :first_furigana
  validates :last_furigana
  validates :birthday
end

