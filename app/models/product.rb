class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 5..500 }

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end

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
end
