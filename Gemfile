source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'fog-aws'
gem 'rake'
# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem "httparty"
gem "rubillow"

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'image_zoomer'
gem 'devise'
gem "simple_form"
gem 'tunemygc'
gem "launchy"
gem 'sendgrid-ruby'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'pg', '~> 0.18.4'
gem "carrierwave", :github => "carrierwaveuploader/carrierwave"
gem "mini_magick"
gem 'rails_12factor', group: :production
gem "bootstrap_form",
    git: "https://github.com/bootstrap-ruby/rails-bootstrap-forms.git",
    branch: "master"

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'pry-rails'
   gem 'rb-readline'
  gem 'railties', '~> 5.0', '>= 5.0.0.1'
  gem 'dotenv-rails'

end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.5.3'
