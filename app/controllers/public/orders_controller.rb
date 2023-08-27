class Public::OrdersController < ApplicationController
  # before_action :authenticate_custmaer!
  def new
    @order = Order.new
    @orders = current_customer.orders.all
    
  end
  
  def index
    @orders = current_customer.orders.all  
  end
end
