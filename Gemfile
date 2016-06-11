source 'https://rubygems.org'
gem 'pg'

gem 'rails', github: 'rails/rails'

# Use Puma as the app server
gem 'puma'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

gem 'bcrypt', '~> 3.1.7'

gem 'active_model_serializers', '~> 0.10.0.rc4'
gem 'omniauth', '>= 1.0.0'
gem 'devise', github: 'plataformatec/devise'
gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'rails_12factor', group: :production
gem 'faker'
gem 'foreman'
gem 'factory_girl_rails'
gem 'database_cleaner'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
