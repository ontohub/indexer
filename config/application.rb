# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
# require 'active_record/railtie'
# require 'action_controller/railtie'
# require 'action_mailer/railtie'
# require 'action_view/railtie'
# require 'action_cable/engine'
# require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Indexer
  # The main Application configuration
  class Application < Rails::Application
    config.load_defaults 5.1
    config.api_only = true
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('app/chewy')
    config.autoload_paths << Rails.root.join('app/indexers')

    # Sequel 5 and sequel-rails always try connect to the database, even if it
    # does not exist AND it should be created by the currently running rake
    # task. This is a workaround:
    tasks_without_connection = %w(db:drop db:create db:recreate)
    # :nocov:
    config.sequel.skip_connect =
      defined?(Rake) &&
      (Rake.application.top_level_tasks & tasks_without_connection).any?
    # :nocov:

    config.after_initialize do
      require 'index'
    end
  end
end
