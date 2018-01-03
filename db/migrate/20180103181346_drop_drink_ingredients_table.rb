class DropDrinkIngredientsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :drink_ingredients
  end
end
