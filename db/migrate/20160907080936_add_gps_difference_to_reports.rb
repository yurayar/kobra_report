class AddGpsDifferenceToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :gps_difference, :integer
  end
end
