class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :title
      t.string :phone
      t.integer :organisation_type

      t.timestamps null: false
    end
  end
end
