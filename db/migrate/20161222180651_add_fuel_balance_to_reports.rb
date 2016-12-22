class AddFuelBalanceToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :fuel_balance, :float
    add_column :reports, :cold_period, :boolean
    add_column :reports, :run_on_track, :boolean
  end
end
