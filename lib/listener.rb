# frozen_string_literal: true

require 'sneakers/runner'

# Runs a worker to listen to RabbitMQ and perform the icoming jobs.
class Listener
  def self.run
    %w(INT TERM).each do |signal|
      Signal.trap(signal) do
        terminate
      end
    end

    Sneakers::Runner.new([IndexingWorker], workers: 1).run
  end

  def self.terminate
    # :nocov:
    exit
    # :nocov:
  end
end
