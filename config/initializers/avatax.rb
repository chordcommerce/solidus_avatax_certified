# frozen_string_literal: true

# DO NOT MODIFY FILE
AVATAX_CLIENT_VERSION = "a0o33000004FH8l"
AVATAX_HEADERS = { 'X-Avalara-UID' => AVATAX_CLIENT_VERSION }.freeze

module Spree
  module Avatax
  end
end

# Build the config after initialization so Spree::AvataxConfiguration (an autoloadable model)
# isn't autoloaded during boot, which Rails 6.1 deprecates. Skip if the host app already
# defined its own Spree::Avatax::Config.
Rails.application.config.after_initialize do
  unless Spree::Avatax.const_defined?(:Config, false)
    Spree::Avatax.const_set(:Config, Spree::AvataxConfiguration.new)
  end
end
