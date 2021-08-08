class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.timestamps
    end

    create_table :recipe_ingredients do |t|
      t.references :recipe
      t.references :ingredient
      t.timestamps
    end
  end
end
