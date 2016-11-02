class Report < ApplicationRecord
  belongs_to :officer
  belongs_to :car

  validate :report_unique, on: :create

  before_save :count_and_check_mileage
  before_save :count_and_check_fuel
  before_save :check_speed


  def report_unique
    if Report.find_by(report_date: self.report_date, car_id: self.car_id)
      errors.add(:report_date, "Рапорт по данному автомобилю уже присутствует в системе.")
    end
  end

  def count_and_check_mileage

    #Check mileage
    self.mileage_day = self.mileage_after - self.mileage_before

    gps_difference = (self.mileage_day - self.mileage_day_gps)
    self.gps_difference = gps_difference

    if self.mileage_day == self.mileage_board
      if self.mileage_day >= self.mileage_day_gps and self.mileage_day - self.mileage_day_gps <= 5
        self.mileage_match = true
      else if self.mileage_day < self.mileage_day_gps and self.mileage_day_gps - self.mileage_day <= 5
        self.mileage_match = true
           else
             self.mileage_match = false
           end
      end
    end
  end

  def count_and_check_fuel
    #Count fuel
    if self.mileage_day >= self.mileage_day_gps
      self.fuel_spend = self.mileage_day.to_f/10
    else
      self.fuel_spend = self.mileage_day_gps.to_f/10
    end
    #Check fuel
    if self.fuel_income > self.fuel_spend
      fuel_difference = (self.fuel_income - self.fuel_spend.to_f)
      self.fuel_difference = fuel_difference.round(2)
    else
      self.fuel_difference = 0
    end
  end

  def check_speed
    #Check speed
    overspeed = 0
    if self.max_speed > 70
      overspeed += self.max_speed - 60.0
      self.overspeed = overspeed
    end

    assign_report_state
  end

  def assign_report_state
    #Define whether report is valid or not
    if self.mileage_match == false or self.fuel_difference > 0 or self.overspeed
      self.report_state_valid = false
    end
  end
end
