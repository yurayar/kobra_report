class AddReportsStateValidToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :report_state_valid, :boolean
  end
end
