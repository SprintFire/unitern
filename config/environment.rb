# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => ENV['smtp_address'],
  :port => ENV['smtp_port'],
  :authentication => :plain,
  :user_name => ENV['smtp_username'],
  :password => ENV['smtp_password'],
  :domain => ENV['smtp_domain'],
  :enable_starttls_auto => true
}
