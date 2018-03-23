class Category < ApplicationRecord
  #has_many :subcategories, clss_name: "subcategory", foreign_key: "category_id"
  has_many :subcategories
end
