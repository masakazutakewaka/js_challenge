class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :asin
      t.string :category
      t.integer :rank
      t.string :dimension
      t.timestamps
    end
  end
end
