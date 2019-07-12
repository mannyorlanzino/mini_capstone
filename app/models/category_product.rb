class CategoryProduct < ApplicationRecord
  validates :product_id, presence: true
  validates :product_id, numericality: true
  validates :category_id, presence: true
  validates :category_id, numericality: true

  belongs_to :product
  belongs_to :category
end
