class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]

  def index
    @items = Item.all.order("created_at ASC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :shipment_id, :price).merge(user_id: current_user.id)
  end
end