class Public::ItemsController < ApplicationController

  include Kaminari::Helpers::HelperMethods

  def top
    @genres = Genre.all
    @items = Item.all
  end



  def index
    @genres = Genre.all
    @items = Item.all
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

    private
  def params_items
    parmas.require(:items).permit(:items_image ,:name )
  end

end