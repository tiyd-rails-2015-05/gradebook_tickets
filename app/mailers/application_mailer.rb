class ApplicationMailer < ActionMailer::Base
  default from: "mailer@donotreply.com"
  layout 'mailer'
end
