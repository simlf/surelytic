class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :organization_id
      t.string :name
      t.string :ga_view_id
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
