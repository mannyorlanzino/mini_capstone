class Image < ApplicationRecord
  belongs_to :product
  validates :url, presence: true
  # def product
  #   Product.find_by(id: product_id)
  # end
end
