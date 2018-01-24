class RepositoryIndexer
  def self.update(id)
    OntohubIndex::Repository.import(id)
  end
end
