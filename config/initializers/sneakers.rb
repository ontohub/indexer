# frozen_string_literal: true

if Rails.env.test?
  Sneakers.configure(connection: BunnyMock.new)
else
  # :nocov:
  Sneakers.
    configure(connection:
              Bunny.new(username: Settings.rabbitmq.username,
                        password: Settings.rabbitmq.password,
                        host: Settings.rabbitmq.host,
                        port: Settings.rabbitmq.port,
                        virtual_host: Settings.rabbitmq.virtual_host))
  Sneakers.logger.level = Logger::WARN
  # :nocov:
end
