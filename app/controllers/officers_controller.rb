class OfficersController < ApplicationController
  before_action :set_officer, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def new
    @officer = Officer.new
  end

  def create
    @officer = Officer.create(officer_params)
    @officers = Officer.all
  end

  def changeOfficer
    @officers = Officer.all
    @officer = Officer.find(params[:officer])
    if @officer.is_active
      @officer.deactivate_officer
      respond_to do |format|
        format.js {render layout: false}
      end
    else
      @officer.activate_officer
      respond_to do |format|
        format.js {render layout: false}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_officer
    @officer = Officer.find(params[:id])
  end
  def officer_params
    params.require(:officer).permit(:name, :username, :email, :password, :admin, :officer_active)
  end
end