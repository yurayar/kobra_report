class AddFieldToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :report_date, :date
  end
end
