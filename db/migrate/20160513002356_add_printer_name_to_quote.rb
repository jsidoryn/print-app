class AddPrinterNameToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :printer_name, :string
  end
end
