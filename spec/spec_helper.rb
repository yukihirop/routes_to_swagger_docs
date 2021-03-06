# frozen_string_literal: true

require 'bundler/setup'
# workaround  uninitialized constant R2OAS::ActiveSupport
require 'action_controller/railtie'
require 'r2-oas'
require 'r2-oas/schema/v3/object/from_routes/all'
require 'pry'

# needs to load the app
require 'dummy_app/application'
require 'rake_helper'

require 'coveralls'
Coveralls.wear!

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # mute log
  R2OAS.logger.level = :null

  config.include PathHelper
  config.include CreateHelper
  config.include FixtureHelper
  config.include TaskHelper
  config.include ConfigHelper
  config.include DummyFileHelper
  config.include PluginHelper
  config.include StoreHelper

  config.after(:each) do
    reset_config
    reset_plugin
    reset_store
    delete_oas_docs
  end
end
