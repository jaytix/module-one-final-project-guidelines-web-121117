class RenameCategoryIdColumnInDrinks < ActiveRecord::Migration[5.1]
  def change
    rename_column(:drinks, :category_id, :category)
  end
end
