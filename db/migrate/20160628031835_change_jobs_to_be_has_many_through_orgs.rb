class ChangeJobsToBeHasManyThroughOrgs < ActiveRecord::Migration
  def change
    create_table :job_orgs do |t|
      t.belongs_to :job, index: true
      t.belongs_to :organisation, index: true
      t.timestamps null: false
    end
  end
end
