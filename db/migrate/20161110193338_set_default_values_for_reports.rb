class SetDefaultValuesForReports < ActiveRecord::Migration[5.0]
  def up
    change_column :reports, :armor_exist_quantity, :integer, default: 0
    change_column :reports, :helmet_exist_quantity, :integer, default: 0
    change_column :reports, :baton_exist, :integer, default: 0
    change_column :reports, :pistol_exist, :integer, default: 0
    change_column :reports, :machine_gun_exist, :integer, default: 0
    change_column :reports, :radio_exist_quantity, :integer, default: 0
    change_column :reports, :videorecorder_exist_quantity, :integer, default: 0
  end

  def down
    change_column :reports, :armor_exist_quantity, :integer, default: nil
    change_column :reports, :helmet_exist_quantity, :integer, default: nil
    change_column :reports, :baton_exist, :integer, default: nil
    change_column :reports, :pistol_exist, :integer, default: nil
    change_column :reports, :machine_gun_exist, :integer, default: nil
    change_column :reports, :radio_exist_quantity, :integer, default: nil
    change_column :reports, :videorecorder_exist_quantity, :integer, default: nil
  end
end
