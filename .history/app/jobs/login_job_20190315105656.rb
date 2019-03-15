class LoginJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    ExampleMailer.welcome_email(user).deliver_now
  end
end
