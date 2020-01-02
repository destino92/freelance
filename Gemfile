source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'rails', '=6.0.0.beta3'


gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'bulma-rails', '~> 0.7.4'
gem 'bulma-extensions-rails', '~> 1.0.30'
gem 'devise', '=4.6.1'

gem 'omniauth', '= 1.9.0'
gem 'omniauth-facebook', '= 5.0.0'
gem 'faker', '=1.9.3'
gem 'kaminari'

gem 'stripe', '=4.18.1'
gem "figaro"
gem 'trestle', '~> 0.8.12'
gem 'trestle-auth', '=0.2.5'
gem 'trestle-search', '=0.3.0'
gem 'trestle-tinymce', '=0.1.3'
gem 'activemerchant', '=1.95.0'
gem "aws-sdk-s3", require: false




group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
