class ContributeWorker
  
  include Sidekiq::Worker
  
  def perform(user)
    ExampleMailer.welcome_email(user).deliver
  end
end
