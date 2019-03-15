class ExampleJob < ActiveJob::Base
  queue_as :default
  
    def perform(user)
      ExampleMailer.welcome_email(user).deliver
    end
  
end
