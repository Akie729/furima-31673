class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_root_path, only: :index
  before_action :sold_out_item, only: [:index]

  def index
    @orderform = OrderForm.new
    @item = Item.find(params[:item_id])
  end


  def create
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
       pay_item
       @orderform.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id:@item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],  
      card: order_params[:token],    
      currency: 'jpy' 
    )
  end

  def move_to_root_path
    @order = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @order.user_id
      redirect_to root_path
    end
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end
end
