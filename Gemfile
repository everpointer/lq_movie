# source 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'bootstrap-sass',   "2.3.0.1"
  gem "font-awesome-sass-rails", "~> 3.0.0"
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  unless ENV["CI"]
    gem 'therubyracer', :platform => :ruby
  end

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do
  gem 'capistrano'
  gem 'rspec-rails'
  gem 'capybara', '~> 2.0.2'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :development do
  gem "pry"
  gem "pry-nav"
  gem "jist"
  gem "better_errors"
  gem "binding_of_caller" # for better_errors local and instance variable inspectation
  gem 'meta_request', '0.2.0'
end

group :test do
  # make selenium work travis-ci xvfb
  #gem "selenium-webdriver", "~> 2.72.2"
  gem 'spork'
  unless ENV["CI"]
    gem 'guard-spork'
    # guard-rspec dependencies
    gem 'rb-fsevent', '~> 0.9.1'
  end
end

group :production do
  gem 'unicorn'
end

# 表单
gem "simple_form"

# paginate
gem "kaminari"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
