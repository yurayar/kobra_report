class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :author_id
      t.integer :car_id
      t.integer :mileage_before
      t.integer :mileage_after
      t.integer :mileage_day
      t.integer :mileage_day_gps
      t.integer :fuel_spend
      t.float :fuel_income

      t.timestamps
    end
  end
end
