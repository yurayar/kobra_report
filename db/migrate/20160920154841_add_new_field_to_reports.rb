class AddNewFieldToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :officer_id, :integer
  end
end
