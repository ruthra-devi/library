class ExampleJob < ActiveJob::Base
  queue_as :default
  
    def perform_later(user)
      byebug
      ExampleMailer.welcome_email(user).deliver
    end
  
end