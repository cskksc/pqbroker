$: << File.expand_path("../../lib", File.dirname(__FILE__))

require_relative '../../postgres_broker'
require 'rack/test'
require 'cucumber/api_steps'

module AppHelper
  def app
	PostgresBroker
  end
end

World(Rack::Test::Methods, AppHelper)