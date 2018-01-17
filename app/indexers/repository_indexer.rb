class RepositoryIndexer
  def self.update(id)
    ::Index::Repository.import(id)
  end
end
