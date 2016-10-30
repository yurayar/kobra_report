class ReportMailer < ApplicationMailer
  default from: 'info@raport.kobra.ks.ua'

  def send_reports_with_issues(email)
    @email = email
    mail(to: @email, subject: "Test")
  end
end
