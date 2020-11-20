class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  include Paginatable
end
