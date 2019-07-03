class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 5..500 }

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
