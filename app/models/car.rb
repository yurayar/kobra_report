class Car < ApplicationRecord
  has_many :reports
  mount_uploader :car_photo, CarPhotoUploader

  def calculateTotalMileage (startDate, endDate)
    result = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.mileage_day
    end

    return result;
  end

  def calculateAverageMileage (startDate, endDate)
    result = 0;
    count = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.mileage_day
      count += 1
    end

    return result/count;
  end

  def calculateTotalFuelSpend (startDate, endDate)
    result = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.fuel_spend
    end

    return result.round(2);
  end

  def calculateTotalFuelIncome (startDate, endDate)
    result = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.fuel_income
    end

    return result.round(2);
  end

  def calculateAverageFuelSpend (startDate, endDate)
    result = 0;
    count = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.fuel_income
      count += 1
    end

    return result.round(2)/count;
  end
end
