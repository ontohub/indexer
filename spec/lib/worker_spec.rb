# frozen_string_literal: true

require 'spec_helper'
require 'ostruct'

describe Indexer::Worker do
  before do
    boot_application
    allow(Sneakers).to receive(:publish)
  end

  subject { Indexer::Worker.new }
  let(:message) { 'message'.to_json }

  context 'result' do
    before do
      allow(subject).to receive(:ack!).and_call_original
      allow(subject).to receive(:reject!).and_call_original
    end

    context 'success' do
      before do
        subject.work(message)
      end

      it 'calls ack!' do
        expect(subject).to have_received(:ack!)
      end

      it 'does not call reject!' do
        expect(subject).not_to have_received(:reject!)
      end
    end
  end
end
