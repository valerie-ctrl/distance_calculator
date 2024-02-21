class OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user)
    @order = Order.new
  end

  def create
    raise
  end

  private

  def order_params
    params.require(:order).permit(:weight, :height, :length, :width, :origin, :destination)
  end
end
