# frozen_string_literal: true

# We need to generally skip sending mails after a user is saved.
module DeviseMailerStub
  RSpec.configure do |config|
    config.include self
    config.before(:each) do
      allow_any_instance_of(User).to receive(:send_devise_notification)
    end
  end
end
