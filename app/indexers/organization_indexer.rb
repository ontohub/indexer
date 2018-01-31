class OrganizationIndexer
  def self.update(id)
    ::Index::OrganizationIndex::Organization.import(id)
  end
end
