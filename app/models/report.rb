class Report < ApplicationRecord
  belongs_to :officer
  belongs_to :car

  validate :report_unique, on: :create

  after_create :count_and_check_mileage
  after_create :check_fuel
  after_create :check_speed


  def report_unique
    if Report.find_by(report_date: self.report_date, car_id: self.car_id)
      errors.add(:report_date, "Рапорт по данному автомобилю уже присутствует в системе.")
    end
  end

  def count_and_check_mileage

    #Check mileage
    self.mileage_day = self.mileage_after - self.mileage_before

    gps_difference = (self.mileage_day - self.mileage_day_gps)
    self.update(:gps_difference => gps_difference)

    if self.mileage_day == self.mileage_board
      if self.mileage_day - self.mileage_day_gps <= 5
        self.update(:mileage_match => true)
      end
    end

  end

  def check_fuel
    #Check fuel
    if self.fuel_income > self.fuel_spend
      fuel_difference = (self.fuel_income - self.fuel_spend.to_f)
      self.update(:fuel_difference => fuel_difference.round(2))
    else
      self.update(:fuel_difference => 0)
    end
  end

  def check_speed
    #Check speed
    if self.max_speed > 70
      overspeed = self.max_speed - 60.0
      self.update(:overspeed => overspeed)
    end
  end
end
