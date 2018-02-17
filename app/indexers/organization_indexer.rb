# frozen_string_literal: true

class OrganizationIndexer
  def self.update(id)
    ::Index::OrganizationIndex::Organization.import(id)
  end
end
