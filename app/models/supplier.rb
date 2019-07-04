class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  def products
    Product.where(supplier_id: id)
  end
end
