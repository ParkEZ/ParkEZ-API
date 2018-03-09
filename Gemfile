source 'https://rubygems.org'
gem 'pg', '~> 0.18.4'

gem 'rails', '~> 5.0.0'

# Use Puma as the app server
gem 'puma'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

gem 'bcrypt', '~> 3.1.7'

gem 'active_model_serializers', '~> 0.10.0.rc4'
gem 'devise', github: 'plataformatec/devise'
gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth'
gem 'omniauth', '>= 1.0.0'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'database_cleaner'

gem 'factory_bot_rails', "~> 4.0"
gem 'faker'
gem 'foreman'
gem 'rails_12factor', group: :production
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
