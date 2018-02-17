# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OrganizationIndexer do
  let(:organization) { create :organization }
  let!(:organization1) { create :organization }

  context 'organization exists' do
    it 'indexes the organization' do
      expect { OrganizationIndexer.update(organization.id) }.
        to update_index(::Index::OrganizationIndex::Organization).
        and_reindex(organization).only
    end
  end

  context 'deleted organization' do
    it 'is removed from the index' do
      OrganizationIndexer.update(organization.id)
      organization.destroy
      expect { OrganizationIndexer.update(organization.id) }.
        to update_index(::Index::OrganizationIndex::Organization).
        and_delete(organization).only
    end
  end
end
