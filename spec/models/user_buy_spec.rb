require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_buy = FactoryBot.build(:user_buy, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  describe '商品の購入' do
    context "商品が購入できる場合" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_buy).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user_buy.building_name = ""
        expect(@user_buy).to be_valid
      end
    end
    context "商品が購入できない場合" do
      it 'tokenが空だと保存できないこと' do
        @user_buy.token = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @user_buy.postal_code = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ形式でないと保存できないこと' do
        @user_buy.postal_code = "1234567"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @user_buy.prefecture_id = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'municipalityが空だと保存できないこと' do
        @user_buy.municipality = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'address_numberが空だと保存できないこと' do
        @user_buy.address_number = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @user_buy.phone_number = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは12桁以上だと保存できない' do
        @user_buy.phone_number = "111111111111"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberは数字のみでないと保存できないこと' do
        @user_buy.phone_number = "aaaaaaa33"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと保存できないこと' do
        @user_buy.user_id = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @user_buy.item_id = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
