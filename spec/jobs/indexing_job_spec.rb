# frozen_string_literal: true

require 'spec_helper'

RSpec.describe IndexingJob, type: :job do
  describe 'perform' do
    it 'prints to stdout' do
      expect { IndexingJob.new.perform(nil) }.to output(/nil/).to_stdout
    end
  end
end
