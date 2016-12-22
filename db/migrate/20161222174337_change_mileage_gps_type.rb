class ChangeMileageGpsType < ActiveRecord::Migration[5.0]
    def up
      change_column :reports, :mileage_day_gps, :float
    end

    def down
      change_column :reports, :mileage_day_gps, :integer
    end
end
