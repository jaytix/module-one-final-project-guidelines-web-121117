class RemoveImgurlColumnFromDrinks < ActiveRecord::Migration[5.1]
  def change
    remove_column :drinks, :image_url
  end
end
