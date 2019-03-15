class LoginJob < ActiveJob::Base
  queue_as :default

  def perform(user)
   render plain:  ExampleMailer.welcome_mail(user).deliver
  end
end
