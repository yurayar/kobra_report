class AddNewFieldNewToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :car_kit, :boolean
  end
end
