Rails.application.configure do
config.action_mailer.delivery_method = :smtp
 config.action_mailer.smtp_settings = {
 :authentication => :plain,
 :address => "smtp.gmail.com",
 :port => 587,
 :domain => 'gmail.com',
 :user_name => ENV["USER_NAME"],
 :password => ENV["USER_PASS"]
 }
end