# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.public_key  = Rails.application.secrets.recaptcha_public_key
  config.private_key = Rails.application.secrets.recaptcha_secret_key
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end