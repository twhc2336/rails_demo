class Subcategory < ApplicationRecord
  belongs_to :category, optional: true
  has_many :products

  def name_wtih_category
  	return "#{category.try(:name)}/#{try(:name)}"
  end
end
