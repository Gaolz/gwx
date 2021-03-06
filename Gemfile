source 'https://gems.ruby-china.org'

gem 'rails', '5.0.2'
gem 'rails-i18n', '5.0.0'
gem 'pg', '0.18.4'
gem 'sass-rails', '5.0.6'
gem 'uglifier', '3.0.0'
gem 'coffee-rails', '4.2.1'
gem 'jquery-rails', '4.1.1'
gem 'turbolinks', '5.0.0'
gem 'jbuilder', '2.4.1'

# uploader
gem 'carrierwave', '0.11.2'
gem 'mini_magick', '4.5.1', require: false
gem 'letter_avatar', '0.3.0'

# cron job
gem 'whenever', '0.9.7', require: false

# background-work
gem 'sidekiq'

# sms
gem 'china_sms', '0.0.7'

# add emoji
gem 'gemoji', '2.1.0'

# use slim as template
gem 'slim-rails', '3.1.0'

# use bootstrap as css framework
gem 'bootstrap', '~> 4.0.0.alpha6'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

gem 'puma', '3.11.0'
gem 'yettings', '0.1.1'
gem 'kaminari', '0.17.0'
gem 'chinese_pinyin', '1.0.1'
gem 'rails-settings-cached', '0.6.5'

gem 'chartkick'
gem 'groupdate'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution
  # and get a debugger console
  gem 'byebug', '9.0.0', platform: :mri
  gem 'rubocop', '0.49.0'
  gem 'rspec-rails', '3.5.1'
  gem 'factory_girl_rails', '4.7.0'
  gem 'pry-rails', '0.3.4'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  # gem 'erd', '0.4.0'
  gem 'web-console', '3.3.1'

  gem 'capistrano', '~> 3.10'
  gem 'capistrano-bundler', '1.3.0'
  gem 'capistrano-rails', '1.3.1'
  gem 'capistrano-rbenv', '2.1.3'
  gem 'capistrano3-puma', '~> 3.1.1'
  gem 'capistrano-sidekiq'

  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.7.2'
  gem 'rack-mini-profiler', '0.10.1', require: false
  gem 'derailed_benchmarks', '~> 1.3.1'
  gem 'stackprof'
  gem 'rails_db'
end

group :test do
  gem 'faker', '1.7.3'
  gem 'capybara', '2.7.1'
  gem 'database_cleaner', '1.5.3'
  gem 'shoulda-matchers', '3.1.1'
  gem 'simplecov', '0.14.1', require: false
end
