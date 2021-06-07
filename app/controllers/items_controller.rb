class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # 商品一覧機能にて実装予定
    # @items = Item.all
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

  private

  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :delivery_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end