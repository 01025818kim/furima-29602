class BuysController < ApplicationController

  def index
    @user_buy = UserBuy.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new(buy_params)
      if @user_buy.valid?
        pay_item
        @user_buy.save
        redirect_to root_path
      else
        render :index
      end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :comment, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :shipment_id, :price).merge(user_id: current_user.id)
  end

  def buy_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :municipality, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end