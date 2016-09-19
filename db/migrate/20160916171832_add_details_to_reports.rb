class AddDetailsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :mileage_board, :integer
    add_column :reports, :max_speed, :float
  end
end
