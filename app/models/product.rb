class Product < ApplicationRecord
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
