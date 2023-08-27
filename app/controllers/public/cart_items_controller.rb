class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += (cart_item.item.unit_price * cart_item.quantity * 1.1).round
    end
  end

  def create
    item_id = params[:cart_item][:item_id].to_i # パラメータからアイテムIDを取得
    quantity = params[:cart_item][:quantity].to_i # パラメータから数量を取得

     if cart_item = current_customer.cart_items.find_by(item_id: item_id)
       cart_item.update(quantity: cart_item.quantity + quantity) # カートアイテムが存在する場合、数量を更新
     else
       cart_item = CartItem.new(params_cart_items) # カートアイテムを新規作成
       cart_item.customer_id = current_customer.id
       if cart_item.save!
        flash[:success] = "#{cart_item.item.name}をカートに追加しました。"
       else
        flash[:error] = "#{cart_item.item.name}をカートに追加できませんでした。"
       end
     end
    redirect_to cart_items_path
  end

  def update
    @cart_items = CartItem.find(params[:id])
    if params[:cart_item][:quantity] == "0"
      @cart_item.destroy
      redirect_to cart_items_path
    elsif @cart_item.update(quantity: params[:cart_item][:quantity])
      redirect_to cart_items_path
    else
      @cart_item = current_customer.cart_items
      @total_price = 0
      @cart_items.each do |cart_item|
      @total_price += (cart_item.item.unit_price * cart_item.quantity * 1.1).round
      render "cart_items/index"
    end
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def params_cart_items
    params.require(:cart_item).permit( :item_id, :quantity )
  end
end
