class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_item, only: [:show, :edit, :update]
  before_action :move_to_edit_update, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private

  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :delivery_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def move_to_item
    @item = Item.find(params[:id])
  end

  def move_to_edit_update
    redirect_to root_path unless current_user.id == @item.user_id
  end
end