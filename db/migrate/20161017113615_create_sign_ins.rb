class CreateSignIns < ActiveRecord::Migration[5.0]
  def change
    create_table :sign_ins do |t|
      t.datetime :sign_in_at
      t.string :sign_in_ip
      t.string :sign_in_officer

      t.timestamps
    end
  end
end
