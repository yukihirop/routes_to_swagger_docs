# frozen_string_literal: true

require 'bundler/setup'
# workaround  uninitialized constant RoutesToSwaggerDocs::ActiveSupport
require 'action_controller/railtie'
require 'routes_to_swagger_docs'
require 'pry'

# needs to load the app
require 'dummy_app/application'
require 'rake_helper'

Dir["./spec/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # mute log
  RoutesToSwaggerDocs.logger.level = :null

  config.include PathHelper
  config.include CreateHelper
  config.include FixtureHelper
  config.include TaskHelper
end
