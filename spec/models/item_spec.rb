require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "画像と名前とコメントとcategoryとstateとdelivery_feeとprefectureとshipmentとpriceがあれば商品は保存される"do
        expect(@item).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it "画像がないと商品は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "名前がないと商品は保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "コメントがないと商品は保存できない" do
        @item.comment = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it "categoryを選択しないと商品は保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "categoryの選択が0の場合に商品は保存できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "stateを選択しないと商品は保存できない" do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "stateの選択が0の場合に商品は保存できない" do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 0")
      end
      it "delivery_feeを選択しないと商品は保存できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "delivery_feeの選択が0の場合に商品は保存できない" do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
      end
      it "prefectureを選択しないと商品は保存できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefectureの選択が0の場合に商品は保存できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "shipmentを選択しないと商品は保存できない" do
        @item.shipment_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end
      it "shipmentの選択が0の場合に商品は保存できない" do
        @item.shipment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment must be other than 0")
      end
      it "priceがないと商品は保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceは全角数字では商品は保存できない" do
        @item.price = ３００
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceは¥299以下では商品は保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceは¥10,000,000以上では商品は保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
