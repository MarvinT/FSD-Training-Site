source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'

gem 'haml'

gem 'omniauth'
gem 'omniauth-google-apps'
gem 'mongrel', '1.2.0.pre2'

gem "selenium-webdriver", "~> 2.13.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer' 
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test, :development do
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions  
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
  gem 'simplecov'
end

group :development, :test do
  gem 'sqlite3' # use SQLite only in development and testing
  gem 'ruby-debug19'
end
group :production do
  gem 'pg' # use PostgreSQL in production (Heroku)
end
