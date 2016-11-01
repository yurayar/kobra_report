# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview
  def send_reports_with_issues
    ReportMailer.send_reports_with_issues('y.yarych@yandex.com')
  end
end
