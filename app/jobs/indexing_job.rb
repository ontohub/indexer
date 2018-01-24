# frozen_string_literal: true

# Post-processes a finished job that was sent to Hets
class IndexingJob < ApplicationJob
  queue_as "#{Settings.rabbitmq.prefix}_indexing"
  ALLOWED_INDEXERS = [RepositoryIndexer,
                      UserIndexer,
                      OrganizationIndexer].map(&:to_s)
  def perform(job)
    indexer_class = "#{job['class']}Indexer"
    if ALLOWED_INDEXERS.include?(indexer_class)
      indexer_class.constantize.update(job['id'])
    else
      raise "Invalid class argument: '#{job['class']}'"
    end
  end
end
