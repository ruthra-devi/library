class BorrowJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    ExampleMailer.borrow_book(user,booksBorrow).deliver
  end
end
