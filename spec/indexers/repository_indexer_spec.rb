# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RepositoryIndexer do
  let(:repository) { create :repository }
  let!(:repository1) { create :repository }

  context 'repository exists' do
    it 'indexes the repository' do
      expect { RepositoryIndexer.update(repository.id) }.
        to update_index(::Index::RepositoryIndex::Repository).
        and_reindex(repository).only
    end
  end

  context 'deleted repository' do
    it 'is removed from the index' do
      RepositoryIndexer.update(repository.id)
      repository.destroy
      expect { RepositoryIndexer.update(repository.id) }.
        to update_index(::Index::RepositoryIndex::Repository).
        and_delete(repository).only
    end
  end
end
