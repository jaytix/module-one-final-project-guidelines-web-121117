class CreateMeasures < ActiveRecord::Migration[5.1]
  def change
    create_table :measures do |t|
      t.string :unit
      t.integer :amount
      t.string :ingredient
      t.string :drink
    end
  end
end
