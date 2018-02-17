# frozen_string_literal: true

require 'spec_helper'

RSpec.describe IndexingJob, type: :job do
  let(:job) do
    {
      'class' => 'Repository',
      'id' => 1,
    }
  end

  before do
    allow(RepositoryIndexer).to receive(:update)
  end

  context 'sucessfully updates the index' do
    it 'updates the index' do
      IndexingJob.new.perform(job)
      expect(RepositoryIndexer).to have_received(:update).with(job['id'])
    end
  end

  context 'fails to update the index' do
    shared_examples 'a bad class parameter' do
      it 'does not call the indexer' do
        begin
          IndexingJob.new.perform(job)
          # rubocop:disable Lint/HandleExceptions
        rescue StandardError
          # rubocop:enable Lint/HandleExceptions
          # We test that the correct error is raised in the example
        end
        expect(RepositoryIndexer).not_to have_received(:update)
      end

      it 'raises an error' do
        expect { IndexingJob.new.perform(job) }.
          to raise_error(StandardError, /Invalid class argument: '.*'/)
      end
    end

    context 'class exists but is not an indexer class' do
      let(:job) do
        {
          'class' => '',
          'id' => 1,
        }
      end
      it_behaves_like 'a bad class parameter'
    end

    context 'class does not exist' do
      let(:job) do
        {
          'class' => '_',
          'id' => 1,
        }
      end
      it_behaves_like 'a bad class parameter'
    end
  end
end
