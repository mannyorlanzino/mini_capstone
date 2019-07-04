class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @suppliers = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    render "show.json.jb"
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.name = params[:name]
    @supplier.email = params[:email]
    @supplier.phone_number = params[:phone_number]
    render "show.json.jb"
  end

  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.destroy
  end
end
