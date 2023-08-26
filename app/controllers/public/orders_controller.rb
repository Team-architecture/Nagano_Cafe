class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = current_public.Orders.all
  end
  
  def index
    @orders = current_public.Orders.all  
  end
end
