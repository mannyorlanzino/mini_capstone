class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id],
    )

    if @product.save
      Image.create!(
        url: params[:url],
        product_id: @product.id,
      )
      redirect_to "/products/#{@product.id}"
    else
      puts "-" * 50
      puts @product.errors.full_messages
      puts "-" * 50
      render "/products/"
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @suppliers = Supplier.all
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @supplier = Supplier.find_by(id: params[:supplier_id])
    @images = Image.where(product_id: params[:id])
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.description = params[:description]
    @product.supplier.id = @supplier.id
    @product.save

    index = 0
    @images.each do |image|
      image.url = params["url#{index}"]
      image.save
      index += 1
    end

    unless params[:urlnew] == ""
      Image.create!(product_id: @product.id, url: params[:urlnew])
    end

    redirect_to "/products"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products"
  end
end
