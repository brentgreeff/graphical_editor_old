require "rubygems"
require "bundler/setup"

Bundler.require

RSpec.configure do |c|
  c.mock_with :rspec
end
