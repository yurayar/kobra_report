class AddUsernameToOfficers < ActiveRecord::Migration[5.0]
  def change
    add_column :officers, :username, :string
  end
end
