class ItemsController < ApplicationController
  before_action :set_item, only: [:new]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private

  # ActiveStorage未実装
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :date_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end