class ExampleJob < ActiveJob::Base
  queue_as :default
  
    def perform(message)
      ExampleMailer.welcome_email(user).deliver
    end
  
end
