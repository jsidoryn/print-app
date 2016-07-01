class RenameJobsOrgTable < ActiveRecord::Migration
  def change
    rename_table :job_orgs, :job_organisations
  end
end
