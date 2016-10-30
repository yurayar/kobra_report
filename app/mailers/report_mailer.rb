class ReportMailer < ApplicationMailer
  default from: "Рапорт дежурного <raport@kobra.ks.ua>"

  def send_reports_with_issues(email)
    @email = email
    mail(to: @email, subject: "Рапорты с несооответствиями")
  end
end
