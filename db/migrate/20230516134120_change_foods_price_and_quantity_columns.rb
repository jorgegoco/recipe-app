class ChangeFoodsPriceAndQuantityColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :price, :decimal, precision: 10, scale: 2
    change_column :foods, :quantity, :decimal, precision: 10, scale: 2, default: 0
  end
end
