source 'http://rubygems.org'

gem 'rails', '3.1.1.rc1'
gem 'sqlite3', :group => :development
gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'will_paginate', '3.0.pre2'

group :development do
  gem 'faker', '0.3.1'
  gem 'rspec-rails', '2.6.1'
  gem 'annotate', 
:git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
end

group :test do
  gem 'rspec-rails', '2.6.1'
  gem 'annotate',
:git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
  gem 'webrat', '0.7.1'
  gem 'spork'
  gem 'factory_girl_rails'
end

group :production do
  gem "pg", :group => :production
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end



gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

