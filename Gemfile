source 'https://rubygems.org'

ruby '2.1.4'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Gem pg
gem 'pg'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Cover my prog
gem 'coveralls', require: false

group :development, :test do
  # Cover my tests
  gem 'simplecov', :require => false, :group => :test

  # Gem pry for debug
  gem 'pry'
  # Test with rspec
  gem 'rspec-rails'
	
  # Policy my ruby
  gem 'rubocop'

  # Policy my commits
  gem 'overcommit'

  # Capybara
  gem 'capybara'

  # Guardfile
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-rubocop'

end

# In order to manipulate csv
gem 'roo'

# Environnement variable
gem 'dotenv-rails'

# Brakeman for security
gem 'brakeman'

# Rails twelve factor
gem 'rails_12factor'

# Inform my api
gem 'swagger-docs'
