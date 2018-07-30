require 'capybara/poltergeist'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random
  config.filter_run_when_matching :focus
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

Capybara.register_driver :poltergeist do |app|
  phantomjs_path = File.absolute_path(Phantomjs.path)
  Capybara::Poltergeist::Driver.new(app,
                                    timeout: 100,
                                    phantomjs: phantomjs_path)
end

Capybara.javascript_driver = :poltergeist
