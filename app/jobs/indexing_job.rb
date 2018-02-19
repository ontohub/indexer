# frozen_string_literal: true

# Post-processes a finished job that was sent to Hets
class IndexingJob < ApplicationJob
  queue_as 'indexing'
  ALLOWED_INDEXERS = [RepositoryIndexer,
                      UserIndexer,
                      OrganizationIndexer].map(&:to_s)
  def perform(job)
    indexer_class = "#{job['class']}Indexer"
    unless ALLOWED_INDEXERS.include?(indexer_class)
      raise "Invalid class argument: '#{job['class']}'"
    end
    indexer_class.constantize.update(job['id'])
  end
end
