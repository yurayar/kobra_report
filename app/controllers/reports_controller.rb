class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_officer!
  before_filter :can_edit, only: :edit

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
    @cars = Car.all
    @q = Report.ransack(params[:q])
    @reports = @q.result.includes(:car)
    @reports = @reports.order(created_at: :desc).page(params[:page]).per(30)
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @cars = Car.all
    @author = current_officer
  end

  # GET /reports/1/edit
  def edit
    @car = Car.find(@report.car_id)
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to reports_path, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        if @report.errors[:report_date]
          format.html { redirect_to reports_path, warning: "Рапорт с такой датой по этому автомобилю уже создан. Попробуйте заново, изменив дату рапорта." }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        else
          redirect_to reports_path
        end
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to reports_path, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:author_id, :car_id, :mileage_before, :mileage_after, :mileage_day, :mileage_day_gps, :fuel_spend, :fuel_income, :gps_difference, :mileage_board, :max_speed, :mileage_match, :fuel_difference, :overspeed, :report_date, :officer_id, :car_kit, :videorecorder_exist_quantity, :videorecorder_quantity, :tablet_exist, :armor_exist_quantity, :armor_quantity, :helmet_exist_quantity, :helmet_quantity, :radio_exist_quantity, :radio_quantity, :radio_portable_exist, :baton_exist, :baton_quantity, :pistol_exist, :pistol_quantity, :machine_gun_exist, :machine_gun_quantity, :cold_period, :run_on_track, :fuel_balance)
    end

    def can_edit
      unless @report.officer == current_officer || current_officer.admin?
        redirect_to reports_path
      end
    end
end
