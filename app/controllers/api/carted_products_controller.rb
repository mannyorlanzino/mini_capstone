class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(status: "carted", user: current_user.id)
    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    @carted_product[:user_id] = current_user.id
    if @carted_product.save
      render "show.json.jb"
    else
      render json: { errors: @carted_product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    @carted_products.update(status: "removed")
    render json: { message: "Cart has been cleared." }
  end
end
