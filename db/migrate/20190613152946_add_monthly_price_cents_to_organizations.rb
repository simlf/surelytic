class AddMonthlyPriceCentsToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :monthly_price_cents, :integer
  end
end
