class AddFieldsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :mileage_match, :boolean
  end
end
