class ExampleJob < ActiveJob::Base
  queue_as :default
  
    def perform_in(user)
      ExampleMailer.welcome_email(user).deliver
    end
  
end