class Order < ApplicationRecord
  # validates :product_id, presence: true
  # validates :quantity, numericality: { greater_than: 0 }

  belongs_to :user
  # belongs_to :product
  has_many :carted_products
  has_many :products, through: :carted_products
  has_many :users, through: :carted_products

  # def subtotal
  #   product.price * quantity
  # end

  # def tax
  #   tax_rate = 0.09
  #   tax_rate * subtotal
  # end

  # def total
  #   tax + subtotal
  # end
end
