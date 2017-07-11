source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# FW
gem 'rails', '~> 5.1.2'

# DB
# gem 'sqlite3'
gem 'pg'

# Server
gem 'puma', '~> 3.7'

# Model
gem 'annotate', github: 'ctran/annotate_models', group: :development
gem 'enum_help'
gem 'kaminari'

# View
gem 'slim-rails'
gem 'html2slim', require: false, group: :development
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'

# Auth
gem 'devise'
gem 'omniauth-twitter'

# Development
group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

# Debug
group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'tapp'
  gem 'bullet'
  gem 'what_methods'
  gem 'awesome_print'
end
group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

# Testing
group :test do
  gem 'rspec-rails', group: :development
  gem 'rspec-its'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'fuubar'
  gem 'factory_girl_rails', group: :development
  gem 'faker', group: :development
  gem 'guard-rspec', require: false
  gem 'database_rewinder'
  gem 'timecop'
end
