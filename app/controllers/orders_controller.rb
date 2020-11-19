class OrdersController < ApplicationController

  def index
    @orderform = OrderForm.new
    @item = Item.find(params[:item_id])
  end


  def create
    @orderform = OrderForm.create(order_params)
  end

  private
  def order_params
    params.require(:orderform).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: item.id)
  end
end
