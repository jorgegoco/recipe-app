class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, numericality: { greater_than: 0, message: 'must be a positive number' },
                       format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: 'only allows up to 2 decimal places' }
end
