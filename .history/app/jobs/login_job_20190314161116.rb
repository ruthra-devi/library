class LoginJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    byebug
    ExampleMailer.welcome_mail(user).deliver
  end
end
