class AddPreparationColumnToDrinks < ActiveRecord::Migration[5.1]
  def change
    add_column :drinks, :preparation, :string
  end
end
