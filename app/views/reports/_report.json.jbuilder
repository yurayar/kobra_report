json.extract! report, :id, :author_id, :car_id, :mileage_before, :mileage_after, :mileage_day, :mileage_day_gps, :fuel_spend, :fuel_income, :created_at, :updated_at
json.url report_url(report, format: :json)