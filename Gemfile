source 'https://rubygems.org'

gem 'rails', '~> 5.1.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'pg', '0.18.4'
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
gem 'devise'
gem 'rails-i18n', '~> 5.0.0'
gem 'simple_form'
gem "font-awesome-rails"
gem 'font-awesome-sass', '~> 5.0.9'
gem 'acts-as-list'
gem 'cancancan'
gem 'rolify'
gem 'carrierwave', '1.2.2'
gem 'mini_magick', '4.7.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.5'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano',         require: false
  gem 'sshkit-sudo',        require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-rails-db',require: false
  gem 'faker'
end

group :production do
  gem 'pg', '0.18.4'
  gem 'fog', '1.42'
  gem 'redis', '~>3.2'
end

group :test do
  gem 'simplecov', :require => false
  gem 'guard-rspec', require: false
  gem 'database_cleaner', '1.6.0'
  gem 'shoulda-matchers', '~> 3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]