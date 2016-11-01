desc 'send reports email'
task send_reports_email: :environment do
  ReportMailer.send_reports_with_issues('y.yarych@yandex.com').deliver!
end