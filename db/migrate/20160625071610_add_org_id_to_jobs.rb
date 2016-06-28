class AddOrgIdToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :organisation, index: true, foreign_key: true
  end
end
