# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Listener do
  let(:sneakers_runner) { double(:sneakers_runner) }

  before do
    allow(Listener).to receive(:terminate)
    allow(Signal).to receive(:trap).and_call_original
    allow(Sneakers::Runner).to receive(:new).and_return(sneakers_runner)
    allow(sneakers_runner).to receive(:run)
  end

  describe 'run' do
    before do
      Listener.run
    end

    %w(INT TERM).each do |signal|
      it "registers an interrupt handler for #{signal}" do
        expect(Signal).to have_received(:trap).with(signal)
      end
    end

    it 'creates a runner' do
      expect(Sneakers::Runner).
        to have_received(:new).
        with(include(IndexingWorker), workers: 1)
    end

    it 'runs a runner' do
      expect(sneakers_runner).to have_received(:run)
    end
  end
end
