class SetDefaultValuesForOptions < ActiveRecord::Migration[5.0]
  def up
    change_column :cars, :armor_quantity, :integer, default: 0
    change_column :cars, :helmet_quantity, :integer, default: 0
    change_column :cars, :baton_quantity, :integer, default: 0
    change_column :cars, :pistol_quantity, :integer, default: 0
    change_column :cars, :machine_gun_quantity, :integer, default: 0
    change_column :cars, :radio_auto_quantity, :integer, default: 0
    change_column :cars, :radio_portable_quantity, :integer, default: 0
  end

  def down
    change_column :cars, :armor_quantity, :integer, default: nil
    change_column :cars, :helmet_quantity, :integer, default: nil
    change_column :cars, :baton_quantity, :integer, default: nil
    change_column :cars, :pistol_quantity, :integer, default: nil
    change_column :cars, :machine_gun_quantity, :integer, default: nil
    change_column :cars, :radio_auto_quantity, :integer, default: nil
    change_column :cars, :radio_portable_quantity, :integer, default: nil
  end

end
