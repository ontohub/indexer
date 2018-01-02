# frozen_string_literal: true

require 'config'
require 'pathname'

module Indexer
  # The Application class encapsulates some basic properties.
  class Application
    ROOT = Pathname.new(File.expand_path('../../../', __FILE__)).freeze
    ENVIRONMENT = (ENV['INDEXER_ENV'] || 'development').freeze

    class << self
      attr_reader :bunny, :hets_version_available, :hets_version_requirement

      def root
        ROOT
      end

      def env
        return @env if @env

        @env = ENVIRONMENT.dup
        %w(test development production).each do |e|
          @env.define_singleton_method("#{e}?") { ENVIRONMENT == e }
        end
        @env
      end

      def boot
        setting_files = ::Config.setting_files(root.join('config'), env)
        ::Config.load_and_set_settings(setting_files)

        initialize_bunny

        true
      end

      private

      def initialize_bunny
        @bunny = Bunny.new(username: Settings.rabbitmq.username,
                           password: Settings.rabbitmq.password,
                           host: Settings.rabbitmq.host,
                           port: Settings.rabbitmq.port)
      end
    end
  end
end
