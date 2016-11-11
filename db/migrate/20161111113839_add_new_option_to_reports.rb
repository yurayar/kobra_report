class AddNewOptionToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :radio_portable_exist, :integer, :default => 0
  end
end
