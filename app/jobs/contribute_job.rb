class ContributeJob < ActiveJob::Base
  queue_as :default

  def perform(user,book)
    ExampleMailer.contribute_book(user,book).deliver
  end
end
