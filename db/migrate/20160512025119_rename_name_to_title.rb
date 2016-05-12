class RenameNameToTitle < ActiveRecord::Migration
  def change
    rename_column :jobs, :name, :title
  end
end
