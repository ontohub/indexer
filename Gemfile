# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.2'

gem 'ontohub-models', github: 'ontohub/ontohub-models',
                      branch: 'master'

gem 'index', github: 'ontohub/index',
             branch: 'master',
             require: false

gem 'bootsnap', require: false
gem 'config', '~> 1.7.1'

# Use these gems for debugging
gem 'awesome_print', '~> 1.8.0'
gem 'pry', '~> 0.11.3'
gem 'pry-byebug', '~> 3.6.0', platform: :mri
gem 'pry-rails', '~> 0.3.4'
gem 'pry-rescue', '~> 1.4.4', platform: :mri
gem 'pry-stack_explorer', '~> 0.4.9.2', platform: :mri

# Sneakers depends on bunny and has the version requirement
gem 'bunny'
gem 'chewy', '~> 5.0.0'
gem 'sneakers', '2.7.0'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.65.0', require: false
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'bunny-mock', '~> 1.7.0'
  gem 'codecov', '~> 0.1.14', require: false
  gem 'database_cleaner', '~> 1.7.0'
  gem 'factory_bot_rails', '~> 5.0.1'
  gem 'faker', '~> 1.9.3'
  gem 'fuubar', '~> 2.3.2'
  gem 'rspec', '~> 3.7.0'
  gem 'rspec-rails', '~> 3.7.2'
end
