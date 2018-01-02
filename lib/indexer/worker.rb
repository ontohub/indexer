# frozen_string_literal: true

require 'json'
require 'sneakers'

module Indexer
  # Waits for jobs and executes them.
  class Worker
    include Sneakers::Worker
    from_queue 'indexer', timeout_job_after: nil

    # Do something useful in this method
    def work(message)
      $stdout.puts 'received message:'
      $stdout.puts message
      $stdout.puts ''
      if true # rubocop:disable Lint/LiteralAsCondition
        # Success (job could be processed)
        ack!
      else
        # Job could not be processed and needs to be re-enqueued
        reject!
      end
    end
  end
end
