class AddActiveToOfficers < ActiveRecord::Migration[5.0]
  def change
    add_column :officers, :officer_active, :boolean
  end
end
