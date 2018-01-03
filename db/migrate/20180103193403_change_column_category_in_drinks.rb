class ChangeColumnCategoryInDrinks < ActiveRecord::Migration[5.1]
  def change
    change_column(:drinks, :category, :string)
  end
end
