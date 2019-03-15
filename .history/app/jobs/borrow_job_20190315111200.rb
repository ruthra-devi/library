class BorrowJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    ExampleMailer.welcome_email(user).deliver
  end
end
