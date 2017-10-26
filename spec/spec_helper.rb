ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-console'

require File.join(File.dirname(__FILE__), '..', './app/app.rb')
require './app/app.rb'
require 'capybara'
require 'capybara/rspec'
require './app/models/api.rb'
require 'rspec'
require 'web_helpers.rb'
require 'webmock/rspec'
require 'json'

WebMock.allow_net_connect!

Capybara.app = App

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start
