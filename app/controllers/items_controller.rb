class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  # ActiveStorage未実装
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :date_id, :selling_price).merge(user_id: current_user.id)
  end
end