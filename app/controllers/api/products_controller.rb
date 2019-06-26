class Api::ProductsController < ApplicationController
  def allproducts
    @allproducts = Product.all
    render "allproducts.json.jb"
  end
end
