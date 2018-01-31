# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UserIndexer do
  let(:user) { create :user }
  let!(:user1) { create :user }

  context 'user exists' do
    it 'indexes the user' do
      expect { UserIndexer.update(user.id) }.
        to update_index(::Index::UserIndex::User).
        and_reindex(user).only
    end
  end

  context 'deleted user' do
    it 'is removed from the index' do
      UserIndexer.update(user.id)
      user.destroy
      expect { UserIndexer.update(user.id) }.
        to update_index(::Index::UserIndex::User).
        and_delete(user).only
    end
  end
end
