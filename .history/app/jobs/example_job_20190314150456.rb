class ExampleJob < ActiveJob::Base
  queue_as :default
  
    def perform_later(user)
      ExampleMailer.welcome_email(user).deliver
    end
  
end