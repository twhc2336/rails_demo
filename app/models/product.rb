class Product < ApplicationRecord
  belongs_to :subcategory, optional: true
end
