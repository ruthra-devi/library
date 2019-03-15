class UserMails < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mails.register.subject
  #
  def register(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email,subject: "Welcome"
  end
end
