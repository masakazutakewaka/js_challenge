class ChangeProductsColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :asin, false
    change_column_null :products, :category, false
    change_column_null :products, :rank, false
    change_column_null :products, :dimension, false
  end
end
