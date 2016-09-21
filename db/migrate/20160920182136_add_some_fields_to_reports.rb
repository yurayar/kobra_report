class AddSomeFieldsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :radio_exist_quantity, :integer
    add_column :reports, :radio_quantity, :integer
    add_column :reports, :pistol_exist, :integer
    add_column :reports, :pistol_quantity, :integer
    add_column :reports, :machine_gun_exist, :integer
    add_column :reports, :machine_gun_quantity, :integer
    add_column :reports, :baton_exist, :integer
    add_column :reports, :baton_quantity, :integer
  end
end
