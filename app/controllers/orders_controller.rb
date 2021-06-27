class OrdersController < ApplicationController
  before_action :move_to_index_create, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?

      pay_item
      
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: order_params[:token],
      currency: 'jpy' 
    )
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
   end
end
