# frozen_string_literal: true

# Worker for indexing the data
class IndexingWorker < ApplicationWorker
  from_queue "#{Settings.rabbitmq.prefix}_indexing",
    threads: 1, prefetch: 1, timeout_job_after: nil
end
