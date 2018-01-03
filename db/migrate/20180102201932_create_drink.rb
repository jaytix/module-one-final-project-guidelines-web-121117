class CreateDrink < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :image_url
      t.string :category
    end
  end
end
