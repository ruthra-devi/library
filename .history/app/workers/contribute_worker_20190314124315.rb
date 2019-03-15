class ContributeWorker
  include ExampleMailer::MAILAPP
  include Sidekiq::Worker

  def perform(user)
    ExampleMailer.welcome_email(user).deliver
  end
end
