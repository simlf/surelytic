class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :frequency
      t.string :ga_report_type
      t.string :ga_link
      t.integer :cd_index
      t.string :cd_regex
      t.integer :cd_scope
      t.string :eec_product_name_regex
      t.string :eec_product_id_regex
      t.string :eec_product_category_regex
      t.string :eec_product_brand_regex
      t.string :event_category_regex
      t.string :event_action_regex
      t.string :event_label_regex
      t.integer :goal_index
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
