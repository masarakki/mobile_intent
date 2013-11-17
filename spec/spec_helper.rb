$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mobile_intent'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../dummy/config/environment",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do |config|
end
