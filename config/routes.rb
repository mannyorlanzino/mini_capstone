# @product_urls = []
# Product.all do |product|
#   @product_urls << product["name"].downcase.delete(" ")
# end

Rails.application.routes.draw do
  namespace :api do
    get "/allproducts" => "products#allproducts"
    get "/product" => "products#product"
    get "/product/:id" => "products#product"
  end
end
