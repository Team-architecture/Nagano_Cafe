class Public::DestinationsController < ApplicationController
  def index
    @destination = Destination.new
    @destinations = Destination.all
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.customer_id = current_customer.id
    if @destination.save
      flash[:notice] = "配送先住所の作成が完了しました。"
    redirect_to destinations_path
    else
    @destinations = current_customer.destinations
    render "index"
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
     if @destination.update(destination_params)
       flash[:notice] = "配送先の更新が完了しました。"
       redirect_to destinations_path
     else
       render "edit"
     end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    @destinations = current_customer.destinations
    flash[:notice] = "配送先は正常に削除されました。"
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:postal_code, :address, :name)
  end

end
