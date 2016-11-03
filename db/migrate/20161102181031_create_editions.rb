class CreateEditions < ActiveRecord::Migration[5.0]
  def change
    create_table :editions do |t|
      t.integer :report_id
      t.integer :officer_id
      t.text :content

      t.timestamps
    end
  end
end
