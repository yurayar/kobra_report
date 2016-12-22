class Report < ApplicationRecord
  belongs_to :officer
  belongs_to :car
  has_many :editions

  validate :report_unique, on: :create

  before_save :count_and_check_mileage
  before_save :count_and_check_fuel
  before_save :check_speed

  after_update :track_changes

  def track_changes
    content = " "
    if self.fuel_income_changed?
      content += "<p>Заправка топлива изменена с #{self.fuel_income_was} л на #{self.fuel_income} л</p>"
    end
    if self.mileage_before_changed?
      content += "<p>Пробег до смены изменен с #{self.mileage_before_was} км на #{self.mileage_before} км</p>"
    end
    if self.mileage_after_changed?
      content += "<p>Пробег до смены изменен с #{self.mileage_after_was} км на #{self.mileage_after} км</p>"
    end
    if self.mileage_day_gps_changed?
      content += "<p>Пробег за смену (GPS) изменен с #{self.mileage_day_gps_was} км на #{self.mileage_day_gps} км</p>"
    end
    if self.mileage_day_gps_changed?
      content += "<p>Пробег за смену (GPS) изменен с #{self.mileage_day_gps_was} км на #{self.mileage_day_gps} км</p>"
    end
    if self.mileage_board_changed?
      content += "<p>Пробег за смену по бортовому журналу изменен с #{self.mileage_board_was} км на #{self.mileage_board} км</p>"
    end
    if self.max_speed_changed?
      content += "<p>Максимальная скорость изменена с #{self.max_speed_was} км/ч на #{self.max_speed} км/ч</p>"
    end
    Edition.create(:report_id => self.id, :officer_id => self.officer.id, :content => content)
  end

  def report_unique
    if Report.find_by(report_date: self.report_date, car_id: self.car_id)
      errors.add(:report_date, "Рапорт по данному автомобилю уже присутствует в системе.")
    end
  end

  def count_and_check_mileage

    #Check mileage
    self.mileage_day = self.mileage_after - self.mileage_before
    self.mileage_day_gps = self.mileage_day_gps.round(2);

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
      self.fuel_spend = self.fuel_spend.round(2)
    else
      self.fuel_spend = self.mileage_day_gps/10
      self.fuel_spend = self.fuel_spend.round(2)
    end
    #Check fuel
    if self.fuel_income.nil?
      self.fuel_income = 0
    end
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
    if self.max_speed > 70 and self.run_on_track == false
      overspeed += self.max_speed - 60.0
      self.overspeed = overspeed
    else
      self.overspeed = 0
    end

    assign_report_state
  end

  def assign_report_state
    #Define whether report is valid or not
    if self.mileage_match == false or self.fuel_difference > 0 or self.overspeed > 0
      self.report_state_valid = false
    else
      self.report_state_valid = true
    end
  end
end
