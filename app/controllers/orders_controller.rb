class OrdersController < ApplicationController
  before_action :move_to_index_create, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      binding.pry
      Payjp.api_key = "sk_test_***********"  # PAY.JPテスト秘密鍵を記述
      Payjp::Charge.create(
        amount: @item.selling_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                # 通貨の種類（日本円）
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:address, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: @item.id)
  end

  def move_to_index_create
    @item = Item.find(params[:item_id])
  end
end
