class CartedProduct < ApplicationRecord
  validates :quantity, numericality: { greater_than: 0 }

  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product
end
