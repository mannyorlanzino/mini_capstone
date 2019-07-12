class Category < ApplicationRecord
  validates :name, presence: true

  has_many :category_products
  has_many :products, through: :category_products
end
