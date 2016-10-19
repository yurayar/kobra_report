class OfficerController < ApplicationController
  before_action :set_officer, only: [:show, :edit, :update, :destroy]

  def new
    @officer = Officer.new
  end

  def create
    @officer = Officer.new(officer_params)
    if @officer.save
      flash[:notice] = "Successfully created User."
      redirect_to root_path
    else
      redirect_to cars_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_officer
    @officer = Officer.find(params[:id])
  end
  def officer_params
    params.require(:officer).permit(:name, :username, :email, :password, :admin)
  end
end