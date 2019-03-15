class BorrowJob < ActiveJob::Base
  queue_as :default

  def perform(user,booksBorrow)
    ExampleMailer.borrow_book(user,booksBorrow).deliver
  end
end
