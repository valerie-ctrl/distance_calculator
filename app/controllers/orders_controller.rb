class OrdersController < ApplicationController

  include OrderHelper

  def index
    @orders = Order.where(user: current_user)
    @order = Order.new
  end

  def create
    price = calculate_price(order_params[:origin], order_params[:destination], order_params[:weight].to_f, order_params[:length].to_f, order_params[:width].to_f, order_params[:height].to_f)
    @order = Order.new(order_params)
    @order.price = price
    @order.user = current_user
    raise
    if @order.save
      redirect_to orders_path, notice: 'Order was successfully created.'
    else
      @orders = Order.all
      flash.now[:alert] = 'Failed to create order'
      render :index
    end

  end

  private

  def order_params
    params.require(:order).permit(:weight, :height, :length, :width, :origin, :destination)
  end
end
