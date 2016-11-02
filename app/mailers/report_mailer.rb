class ReportMailer < ApplicationMailer
  default from: "Рапорт дежурного <raport@kobra.ks.ua>"

  def send_reports_with_issues(email)
    @reports_with_issues = Report.all.where("report_date > ? and report_state_valid = ?", Time.now-7.days, false)
    @email = email
    mail(to: @email, subject: "Рапорты с несооответствиями")
  end
end
