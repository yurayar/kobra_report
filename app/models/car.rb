class Car < ApplicationRecord
  has_many :reports
  mount_uploader :car_photo, CarPhotoUploader

  def calculateTotalMileage (attribute, startDate, endDate)
    result = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.send(attribute)
    end

    return result.round(1);
  end

  def calculateTotalMileageBoard (startDate, endDate)
    result = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.mileage_board
    end

    return result;
  end

  def calculateTotalMileageGPS (parameter, startDate, endDate)
    result = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.send(parameter)
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

    return (result/count).round(1);
  end

  def calculateTotalFuelSpend (startDate, endDate)
    result = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.fuel_spend
    end

    return result.round(1);
  end

  def calculateTotalFuelIncome (startDate, endDate)
    result = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.fuel_income
    end

    return result.round(1);
  end

  def calculateAverageFuelSpend (startDate, endDate)
    result = 0;
    count = 0;
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      result += report.fuel_income
      count += 1
    end

    return (result/count).round(1);
  end

  def calculateFuelDifference (startDate, endDate)
    income = 0;
    spend = 0
    reports = Report.where(:car_id => self.id, :report_date => Date.parse(startDate)..Date.parse(endDate)).to_a
    reports.each do |report|
      income += report.fuel_income
      spend += report.fuel_spend
    end

    return (income - spend).round(1);
  end
end
