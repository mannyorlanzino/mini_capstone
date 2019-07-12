class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    # @orders = current_user.orders
    @orders = Order.all.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def show
    # @order = current_user.orders.find_by(id: params[:id])
    @order = Order.find_by(user_id: current_user.id, id: params[:id])
    render "show.json.jb"
  end

  def create
    user_id = current_user.id
    carted_products = current_user.carted_products.where(status: "carted")

    subtotal = 0
    tax = 0
    total = 0
    purchased_product_ids = []
    carted_products.each do |carted_product|
      subtotal = subtotal + carted_product.product.price
      tax = tax + carted_product.product.tax
      total = total + subtotal + tax
      carted_product.update(status: "purchased")
      purchased_product_ids << carted_product.id
    end

    @order = Order.new(
      user_id: user_id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )

    if @order.save
      purchased_product_ids.each do |purchased_product_id|
        CartedProduct.where(id: purchased_product_id).update(order_id: @order.id)
      end
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
