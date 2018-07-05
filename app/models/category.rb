class Category < ApplicationRecord
  has_many :children, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Category.name, optional: true
end
