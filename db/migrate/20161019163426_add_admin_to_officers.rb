class AddAdminToOfficers < ActiveRecord::Migration[5.0]
  def change
    add_column :officers, :admin, :boolean, default: false
  end
end
