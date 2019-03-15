class BorrowWorker
  include Sidekiq::Worker
  def perform(user,booksBorrow)
    ExampleMailer.borrow_book(user,booksBorrow).deliver
  end
end
