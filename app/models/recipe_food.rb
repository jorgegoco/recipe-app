class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
