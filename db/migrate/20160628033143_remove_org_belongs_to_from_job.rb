class RemoveOrgBelongsToFromJob < ActiveRecord::Migration
  def up
    remove_column :jobs, :organisation_id
  end

  def down
    add_reference :jobs, :organisation, index: true, foreign_key: true
  end
end
