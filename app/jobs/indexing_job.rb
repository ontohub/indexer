# frozen_string_literal: true

# Post-processes a finished job that was sent to Hets
class IndexingJob < ApplicationJob
  queue_as "#{Settings.rabbitmq.prefix}_indexing"

  def perform(job)
    "#{job['class']}Indexer".constantize.update(job['id'])
  end
end
