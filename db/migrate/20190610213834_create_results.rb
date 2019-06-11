class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :test_id
      t.boolean :correct
      t.integer :number_total_values
      t.integer :number_incorrect_values
      t.jsonb :top_incorrect_values
      t.references :test, foreign_key: true


      t.timestamps
    end
  end
end
