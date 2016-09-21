class Report < ApplicationRecord
  belongs_to :officer
  belongs_to :car

  after_create :count_dif
  after_create :check_data
  after_create :check_fuel
  after_create :check_speed

  def count_dif
    gps_difference = (self.mileage_day - self.mileage_day_gps)
    self.update(:gps_difference => gps_difference)
  end

  def check_data
    #Check mileage
    if (self.mileage_after - self.mileage_before == self.mileage_day) and self.mileage_day == self.mileage_board
      if (self.mileage_day - self.mileage_day_gps == 0) or (self.mileage_day - self.mileage_day_gps <= 5)
        self.update(:mileage_match => true)
      end
    end
  end

  def check_fuel
    #Check fuel
    if self.fuel_income > self.fuel_spend
      fuel_difference = (self.fuel_income - self.fuel_spend.to_f)
      self.update(:fuel_difference => fuel_difference)
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
