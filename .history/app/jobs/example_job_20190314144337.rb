class ExampleJob < ActiveJob::Base
  queue_as :default
  
    def perform(user)
      ExampleMailer.welcome_email(user).deliver_later(wait_until: 5.minutes.from_now)
    end
  
end