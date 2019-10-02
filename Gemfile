# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'devise_token_auth', '~> 1.1', '>= 1.1.3'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 0.18.2'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# gem 'rack-cors'

group :test do
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'factory_bot_rails', '~> 5.1'
  gem 'faker', '~> 1.6', '>= 1.6.3'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-rails', '~> 2.3', '>= 2.3.2'
end

group :development do
  gem 'annotate', '~> 3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
