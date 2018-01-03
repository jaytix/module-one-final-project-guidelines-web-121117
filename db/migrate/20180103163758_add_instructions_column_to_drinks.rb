class AddInstructionsColumnToDrinks < ActiveRecord::Migration[5.1]
  def change
    add_column :drinks, :instructions, :string
  end
end
