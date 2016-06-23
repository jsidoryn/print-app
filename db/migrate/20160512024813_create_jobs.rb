class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :job_number
      t.text :description
      t.integer :state, default: 0

      t.timestamps null: false
    end
  end
end
