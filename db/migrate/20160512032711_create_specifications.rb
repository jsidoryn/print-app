class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.string :title
      t.text :description
      t.string :quote_due
      t.string :job_due
      t.boolean :proof_required
      t.boolean :press_check_required
      t.text :notes
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
