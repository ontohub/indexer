class RepositoryIndexer
  def self.update(id)
    ::Index::RepositoryIndex::Repository.import(id)
  end
end
