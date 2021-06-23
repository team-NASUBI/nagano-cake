class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_when_signup.subject
  #
  def send_when_signup(email, last_name)
    @last_name = last_name

    mail to: email, subject: "会員登録が完了しました!"
  end
end
