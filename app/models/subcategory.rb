class Subcategory < ApplicationRecord
  belongs_to :category, optional: true
  has_many :products

  def name_wtih_category
    if category
      return "#{category.name}/#{name}"
    else
      return name
    end
  end
end
