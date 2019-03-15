class ReturnJob < ActiveJob::Base
  queue_as :default

  def perform(user,booksBorrow)
    ExampleMailer.borrow_remainder(user,booksBorrow).deliver
  end
end
