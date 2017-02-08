class AddDefaultActiveValueToOfficers < ActiveRecord::Migration[5.0]
  def up
    change_column :officers, :officer_active, :boolean, default: true
  end

  def down
    change_column :officers, :officer_active, :boolean, default: nil
  end
  
end
