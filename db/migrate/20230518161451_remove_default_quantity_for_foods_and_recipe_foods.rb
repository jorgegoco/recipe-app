class RemoveDefaultQuantityForFoodsAndRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :quantity, :decimal, precision: 10, scale: 2, default: nil
    change_column :recipe_foods, :quantity, :decimal, precision: 10, scale: 2, default: nil
  end
end
