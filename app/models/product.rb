class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 5..500 }

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products

  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end

  has_many :category_products
  has_many :categories, through: :category_products
  has_many :orders

  def is_discounted?
    price <= 10
  end

  def tax
    tax_rate = 0.09
    tax = tax_rate * price
  end

  def total
    price + tax
  end

  # def categories
  #   array = []
  #   category_products.each do |element|
  #     array << element.category
  #   end
  #   array
  # OR
  #   category_products.map { |category_product| category_product.category }
  # end
end
