class Api::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    # @orders = Order.all.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    # @order = Order.find_by(user_id: current_user.id, id: params[:id])
    render "show.json.jb"
  end

  def create
    user_id = current_user.id
    @order = Order.new(
      user_id: user_id,
      product_id: params[:product_id],
      quantity: params[:quantity],
    )

    @order[:subtotal] = @order.subtotal
    @order[:tax] = @order.tax
    @order[:total] = @order.total

    if @order.save
      render "show.json.jb"
    else
      render json: { message: "Order failed." }
    end
  end
end
