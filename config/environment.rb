# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Rails.application.configure do
  config.assets.initialize_on_precompile = false
end
