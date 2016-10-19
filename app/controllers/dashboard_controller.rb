class DashboardController < ApplicationController
  def index
    @officers = Officer.all
    @authorizations = SignIn.all
  end
end
