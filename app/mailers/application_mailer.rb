class ApplicationMailer < ActionMailer::Base
  default from: 'nobody@parkez.herokuapp.com'
  delivery_options = { user_name: ENV["MAILGUN_SMTP_LOGIN"],
                       password: ENV["MAILGUN_SMTP_PASSWORD"],
                       address: ENV["MAILGUN_SMTP_SERVER"] }
  layout 'mailer'
end
