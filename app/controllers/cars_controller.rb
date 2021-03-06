class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin

  respond_to :html, :js

  @widgetStart
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
    @q = Car.ransack(params[:q])
    @cars = @q.result(distinct: true)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    if @widgetStart.nil?
      @widgetStart = 1.month.ago.strftime("%d/%m/%Y")
      @widgetEnd = Date.today.strftime("%d/%m/%Y")
      @period = 30
    end
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def renderWidgets
    @car = Car.find(params[:car_id])
    @widgetStart = params[:startDate]
    @widgetEnd = params[:endDate]
    @period = (DateTime.parse(@widgetEnd) - DateTime.parse(@widgetStart)).to_i
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:name, :legal_num, :call_num, :mileage, :car_base, :car_photo, :radio_auto_quantity, :radio_portable_quantity, :armor_quantity, :baton_quantity, :helmet_quantity, :pistol_quantity, :machine_gun_quantity)
    end

    def check_if_admin
      redirect_to root_path unless current_officer.admin?
    end
end
