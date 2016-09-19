class AddNameToOfficers < ActiveRecord::Migration[5.0]
  def change
    add_column :officers, :name, :string
  end
end
