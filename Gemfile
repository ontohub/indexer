# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'

gem 'ontohub-models', github: 'ontohub/ontohub-models',
                      branch: 'master'

gem 'index', github: 'ontohub/index',
             branch: 'master',
             require: false

gem 'bootsnap', require: false
gem 'config', '~> 1.7.0'

# Use these gems for debugging
gem 'awesome_print', '~> 1.8.0'
gem 'pry', '~> 0.11.3'
gem 'pry-byebug', '~> 3.6.0', platform: :mri
gem 'pry-rails', '~> 0.3.4'
gem 'pry-rescue', '~> 1.4.4', platform: :mri
gem 'pry-stack_explorer', '~> 0.4.9.2', platform: :mri

# Sneakers depends on bunny and has the version requirement
gem 'bunny'
gem 'chewy', '~> 0.10.1'
gem 'sneakers', '2.6.0'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.52.1', require: false
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'bunny-mock', '~> 1.7.0'
  gem 'codecov', '~> 0.1.10', require: false
  gem 'database_cleaner', '~> 1.6.2'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'faker', '~> 1.8.7'
  gem 'fuubar', '~> 2.3.0'
  gem 'rspec', '~> 3.7.0'
  gem 'rspec-rails', '~> 3.7.2'
end
