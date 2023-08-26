class Admin::ItemsController < ApplicationController
#aaaa
  def index
    @item = Item.new
    @items =Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    logger.debug "Received item_params: #{item_params.inspect}"
    @item = Item.new(item_params)
    if @item.save
      flash.now[:success] = "商品の新規登録が完了しました。"
      redirect_to admin_item_path(@item)
    else
      flash.now[:danger] = "商品の新規登録内容に不備があります。"
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
     if @item.update(item_params)
       flash.now[:success] = "商品詳細の変更が完了しました。"
       redirect_to admin_item_path(@item)
     else
       flash.now[:danger] = "商品詳細の変更内容に不備があります。"
       render :edit
     end
  end
end

private

  def item_params
    params.require(:item).permit(:genre_id, :name, :explanation, :image_id, :unit_price, :is_selling_status, :is_active)
  end
