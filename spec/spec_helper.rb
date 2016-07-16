ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'application.rb')
require 'rspec'
require 'rack/test'
require 'factory_girl'
require 'factories.rb'

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

configure do 
  Log = Logger.new("sinatra.log")
  Log.level  = Logger::INFO 
end
