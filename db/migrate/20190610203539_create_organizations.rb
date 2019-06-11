class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :ga_account_service_id
      t.integer :current_credits
      t.integer :monthly_credits

      t.timestamps
    end
  end
end
