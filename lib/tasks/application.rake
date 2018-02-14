# frozen_string_literal: true

namespace :application do
  desc 'Run the application'
  task run: :environment do
    Listener.run
  end

  desc 'Run the interactive console with the application loaded'
  task console: :environment do
    Pry.start
  end
end
