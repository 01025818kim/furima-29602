class BuysController < ApplicationController
  before_action :authenticate_user!


  def index
    @user_buy = UserBuy.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    elsif
      @item.buy.present?
      redirect_to root_path
    end
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