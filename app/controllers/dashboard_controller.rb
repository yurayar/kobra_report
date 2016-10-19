class DashboardController < ApplicationController
  def index
    if current_officer.admin?
    @officers = Officer.all
    @authorizations = SignIn.all
    else
      redirect_to root_path
    end
  end
end
