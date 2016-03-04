class ApplicationMailer < ActionMailer::Base
  default from: 'nobody@parkez.herokuapp.com'
  layout 'mailer'
end
