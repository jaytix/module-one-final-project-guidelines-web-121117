class CreateMeasures < ActiveRecord::Migration[5.1]
  def change
    create_table :measures do |t|
      t.string :unit
      t.integer :amount
      t.references :ingredient
      t.references :drink
    end
  end
end
