class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    Order.create
  end
end
