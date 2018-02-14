# frozen_string_literal: true

# Worker for indexing the data
class IndexingWorker < ApplicationWorker
  from_queue 'indexing', threads: 1, prefetch: 1, timeout_job_after: nil,
    vhost: Settings.rabbitmq.virtual_host
end
