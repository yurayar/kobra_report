class AddOptionsToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :armor_quantity, :integer
    add_column :cars, :baton_quantity, :integer
    add_column :cars, :helmet_quantity, :integer
    add_column :cars, :pistol_quantity, :integer
    add_column :cars, :machine_gun_quantity, :integer
    add_column :cars, :radio_auto_quantity, :integer
    add_column :cars, :radio_portable_quantity, :integer
  end
end
