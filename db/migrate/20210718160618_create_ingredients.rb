class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :min_price
      t.float :max_price
      t.timestamps
    end
  end
end
