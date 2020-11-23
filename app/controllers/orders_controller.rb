class OrdersController < ApplicationController

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

end
