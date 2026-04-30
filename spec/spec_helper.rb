# frozen_string_literal: true

# spec_helper.rb - RSpec configuration file
# This file sets up RSpec with common configurations

RSpec.configure do |config|
  # Display output in color
  config.color = true

  # Use more verbose output format
  config.formatter = :documentation

  # Fail fast - stop on first failure
  # Uncomment the line below to enable fail fast
  # config.fail_fast = true

  # Random test order to catch order-dependent tests
  # config.order = :random

  # All tests should include helper methods from this file
  # Add shared examples and helper methods here as needed
end
