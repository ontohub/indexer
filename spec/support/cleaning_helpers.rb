# frozen_string_literal: true

RSpec.configure do |config|
  # DatabaseCleaner should perform after every example and a full clean before
  # the suite
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each, :no_transaction) do |example|
    # :nocov:
    DatabaseCleaner.strategy = :truncation
    example.run
    DatabaseCleaner.strategy = :transaction
    # :nocov:
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
