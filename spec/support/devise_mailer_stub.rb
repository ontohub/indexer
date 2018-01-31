# frozen_string_literal: true

module DeviseMailerStub
  RSpec.configure do |config|
    config.include self
    config.before(:each) do
      allow_any_instance_of(User).to receive(:send_devise_notification)
    end
  end
end
