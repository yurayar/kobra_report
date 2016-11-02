class ChangeReportFuelSpendType < ActiveRecord::Migration[5.0]
  def up
    change_column :reports, :fuel_spend, :float
  end

  def down
    change_column :reports, :fuel_spend, :integer
  end
end
