class AddColumnsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :fuel_difference, :float
    add_column :reports, :overspeed, :integer
  end
end
