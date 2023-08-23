class Public::DestinationsController < ApplicationController
  def index
    @destination = Destination.new
    @destinations = Destination.all
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.save
    redirect_to destinations_path
  end


  private

  def destination_params
    params.require(:destination).permit(:postal_code, :address, :name)
  end

end
