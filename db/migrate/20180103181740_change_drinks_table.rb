class ChangeDrinksTable < ActiveRecord::Migration[5.1]
  def change
    change_table :drinks do |t|
      t.remove :image_url
      t.string :ingredients
      t.rename :instructions, :preparation
    end
  end
end
