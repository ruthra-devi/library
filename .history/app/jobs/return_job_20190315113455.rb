class ReturnJob < ActiveJob::Base
  queue_as :default

  def perform()
    ExampleMailer.borrow_remainder(user,booksBorrow).deliver
  end
end
