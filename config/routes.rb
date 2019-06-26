Rails.application.routes.draw do
  namespace :api do
    get "/allproducts" => "products#allproducts"
  end
end
