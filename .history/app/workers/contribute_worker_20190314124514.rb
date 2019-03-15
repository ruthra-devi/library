class ContributeWorker
  include ExampleMailer::Mail
  include Sidekiq::Worker

  def perform(user)
    ExampleMailer.welcome_email(user).deliver
  end
end
