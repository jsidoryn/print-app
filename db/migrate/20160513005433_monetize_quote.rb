class MonetizeQuote < ActiveRecord::Migration
  def up
    remove_column :quotes, :cost_1
    remove_column :quotes, :cost_2
    remove_column :quotes, :cost_3

    add_monetize :quotes, :cost_1, amount: { null: true, default: nil }
    add_monetize :quotes, :cost_2, amount: { null: true, default: nil }
    add_monetize :quotes, :cost_3, amount: { null: true, default: nil }
  end

  def down
    add_column :quotes, :cost_1, :integer
    add_column :quotes, :cost_2, :integer
    add_column :quotes, :cost_3, :integer
    remove_monetize :quotes, :cost_1
    remove_monetize :quotes, :cost_2
    remove_monetize :quotes, :cost_3
  end
end
