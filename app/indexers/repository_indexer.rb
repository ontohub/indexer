# frozen_string_literal: true

class RepositoryIndexer
  def self.update(id)
    ::Index::RepositoryIndex::Repository.import(id)
  end
end
