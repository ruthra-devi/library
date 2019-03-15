class ContributeWorker
  include ExampleMailer::MailApp
  include Sidekiq::Worker

  def perform(user)
    ExampleMailer.welcome_email(user).deliver
  end
end
