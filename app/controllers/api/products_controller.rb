class Api::ProductsController < ApplicationController
  def allproducts
    @allproducts = Product.all
    render "allproducts.json.jb"
  end

  # def product # Using array index
  #   id = params["id"].to_i - 1
  #   @product = Product.all[id]
  #   render "product.json.jb"
  # end

  def product # Using .find_by method
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render "product.json.jb"
  end
end
