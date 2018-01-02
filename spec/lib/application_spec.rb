# frozen_string_literal: true

require 'spec_helper'

describe Indexer::Application do
  context 'before booting' do
    it 'there are no settings' do
      expect { Settings }.to raise_error(NameError)
    end

    it 'has the correct root' do
      expect(Indexer::Application.root).
        to eq(Pathname.new(File.expand_path('../../..', __FILE__)))
    end

    it 'the environment string is set' do
      expect(Indexer::Application.env).to eq('test')
    end

    it 'the environment method test? is setup' do
      expect(Indexer::Application.env.test?).to be(true)
    end

    it 'the environment method development? is setup' do
      expect(Indexer::Application.env.development?).to be(false)
    end

    it 'the environment method production? is setup' do
      expect(Indexer::Application.env.production?).to be(false)
    end
  end

  context 'after booting' do
    before do
      boot_application
    end

    context 'bunny' do
      it 'was initialized' do
        expect(Bunny).
          to have_received(:new).
          with(username: 'tester',
               password: 'testing',
               host: '::1',
               port: 25672)
      end

      it 'is available' do
        expect(Indexer::Application.bunny).to be_a(BunnyMock::Session)
      end
    end
  end
end
