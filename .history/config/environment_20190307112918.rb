# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = { :address => "smtp.gmail.com",
     :port => "587", :domain => "gmail.com", :user_name => "ruthra1206@gmail.com", 
    :password => "ruthra9793", :authentication => "plain", :enable_starttls_auto => true }