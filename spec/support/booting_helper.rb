# frozen_string_literal: true

require 'ostruct'

# Helper methods for booting the application
module BootingHelper
  def boot_application
    Indexer::Application.boot
    stub_sneakers_logger
  end

  protected

  def stub_sneakers_logger
    logger = double(logger)
    allow(Sneakers).to receive(:logger).and_return(logger)
    %i(level= debug info warn error fatal).each do |method|
      allow(logger).to receive(method)
    end
  end
end

RSpec.configure do |config|
  config.include BootingHelper
end
