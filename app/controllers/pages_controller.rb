class PagesController < ApplicationController
  def home
    @cars = Car.order('id ASC')
    @reports = Report.all
    @report = Report.new
    @author = current_officer
    @today = Time.zone.now.beginning_of_day
  end
end
