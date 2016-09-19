require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post reports_url, params: { report: { author_id: @report.author_id, car_id: @report.car_id, fuel_income: @report.fuel_income, fuel_spend: @report.fuel_spend, mileage_after: @report.mileage_after, mileage_before: @report.mileage_before, mileage_day: @report.mileage_day, mileage_day_gps: @report.mileage_day_gps } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test "should show report" do
    get report_url(@report)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_url(@report)
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { author_id: @report.author_id, car_id: @report.car_id, fuel_income: @report.fuel_income, fuel_spend: @report.fuel_spend, mileage_after: @report.mileage_after, mileage_before: @report.mileage_before, mileage_day: @report.mileage_day, mileage_day_gps: @report.mileage_day_gps } }
    assert_redirected_to report_url(@report)
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
