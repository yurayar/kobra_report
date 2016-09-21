class AddNewDataFieldsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :videorecorder_exist_quantity, :integer
    add_column :reports, :videorecorder_quantity, :integer
    add_column :reports, :tablet_exist, :boolean
    add_column :reports, :armor_exist_quantity, :integer
    add_column :reports, :armor_quantity, :integer
    add_column :reports, :helmet_exist_quantity, :integer
    add_column :reports, :helmet_quantity, :integer
  end
end
