class Public::OrdersController < ApplicationController
  # before_action :authenticate_custmaer!
  def new
    @order = Order.new
    @orders = current_customer.orders.all
  end
  
  def confirm
    @cart_items = current_customer.cart_items.all
    @num = 0
    
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    # @orderのshipping_feeを800にする
    if params[:choice] == "0"
      @order.postal_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
      
    elsif params[:choice] == "1"
      # @new_destination = Destination.find(params[:destination_id])
      @destination = Destination.find(params[:destination_id])
      @order.postal_code = @destination.postal_code
      @order.address = @destination.address
      @order.name = @destination.name
    else
      # new_destination = Destination.create(
      #   customer_id: current_customer.id,
      #   postal_code: '新しい郵便番号',
      #   address: '新しい住所',
      #   name: '新しい宛名'
      #   )
      #   @order.postal_code = new_destination.postal_code
      #   @order.address = new_destination.address
      #   @order.name = new_destination.name
      # ①adistinationを作成
      # ②作成した↑をelsifへ登録する
    end
  end
  
  def index
    @orders = current_customer.orders.all  
  end
  
  def show
    @order = Order.find(current_customer.id)
    @orders = current_customer.orders.all
  end
end

private
  def order_params
    params.require(:order).permit(:how_to_pay,:postal_code,:address,:name,:destination_id)
  end
