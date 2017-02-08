class DashboardController < ApplicationController

  def index
    if current_officer.admin?
    @officers = Officer.all
    @authorizations = SignIn.all
    @reports_with_issues = Report.all.where("report_date > ? and report_state_valid = ?", Time.now-2.days, false)
    else
      redirect_to root_path
    end
  end

  def officers
    @officers = Officer.all
  end

  def authorizations
    @authorizations = SignIn.all
  end

  def activity
    @editions = Edition.all
  end
end
