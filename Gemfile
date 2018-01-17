source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "3.1.11"
gem "coffee-rails", "~> 4.2"
gem "font-awesome-rails"
gem "font-awesome-sass"
gem "i18n", "~> 0.7.0"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "materialize-sass"
gem "mysql2", ">= 0.3.18", "< 0.5"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.4"
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "therubyracer", platforms: :ruby
gem "toastr-rails"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "uglifier", ">= 1.3.0"
gem "will_paginate", "~> 3.1.0"
gem "carrierwave", "1.2.2"
gem "omniauth", "~> 1.7", ">= 1.7.1"
gem "omniauth-google-oauth2", "~> 0.5.2"
gem "omniauth-facebook", "~> 4.0"
gem "mini_magick", "4.7.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
