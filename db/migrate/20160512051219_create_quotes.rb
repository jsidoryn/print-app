class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :line_item_1
      t.string :cost_1
      t.string :line_item_2
      t.string :cost_2
      t.string :line_item_3
      t.string :cost_3
      t.string :line_item_4
      t.string :cost_4
      t.string :line_item_5
      t.string :cost_5
      t.text :notes
      t.references :specification, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
