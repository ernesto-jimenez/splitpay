source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'rack-force_domain'
gem 'paypal_adaptive'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'omniauth-paypal', :git => 'https://github.com/surferdwa/omniauth-paypal.git'
gem 'gravatar_image_tag'

gem 'turbolinks'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails',   '~> 3.2.3'
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

group :development, :test do
  gem 'autotest-rails'
  gem 'autotest-growl'
  gem 'autotest-fsevent'
end

# Deploy with Capistrano
gem 'capistrano'

group :production do
  gem 'mysql2' # If using mysql in development, this can be outside the production group.
  gem 'therubyracer'
end

# To use debugger
group :development do
  gem 'debugger'
end
