source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails',                    '~> 5.2.0'
gem 'sqlite3'
gem 'puma',                     '~> 3.11'
gem 'sass-rails',               '~> 5.0'
gem 'uglifier',                 '>= 1.3.0'
gem 'coffee-rails',             '~> 4.2'
gem 'turbolinks',               '~> 5'
gem 'jbuilder',                 '~> 2.5'
gem 'bootsnap',                 '>= 1.1.0', require: false
gem 'jquery-rails'
gem 'bcrypt',                   '~> 3.1.7'
gem 'tzinfo-data'

group :development do
  gem 'web-console',            '>= 3.3.0'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'rubocop',                '~> 0.58.2', require: false
  gem 'pry-rails',              '~> 0.3.4'
end

group :test do
  gem 'phantomjs'
  gem 'poltergeist'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'rspec-rails',            '~> 3.7'
  gem 'factory_bot_rails'
end
