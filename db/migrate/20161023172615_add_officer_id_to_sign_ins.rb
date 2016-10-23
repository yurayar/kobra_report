class AddOfficerIdToSignIns < ActiveRecord::Migration[5.0]
  def change
    add_column :sign_ins, :officer_id, :integer
  end
end
