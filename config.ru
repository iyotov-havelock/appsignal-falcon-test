require_relative 'app'
require 'async/http/endpoint'
require 'openssl'
require "appsignal"

ssl_context = OpenSSL::SSL::SSLContext.new
ssl_context.cert = OpenSSL::X509::Certificate.new(File.read("config/ssl/cert.pem"))
ssl_context.key = OpenSSL::PKey::RSA.new(File.read("config/ssl/key.pem"))

ENV["APPSIGNAL_APP_ENV"] = "development"

Appsignal.configure do |config|
  config.active = true
  config.name = "foobar"
  config.log_level = "debug"
  config.push_api_key = ""

  # Configure actions that should not be monitored by AppSignal.
  # For more information see our docs:
  # https://docs.appsignal.com/ruby/configuration/ignore-actions.html
  # config.ignore_actions << "ApplicationController#isup"

  # Configure errors that should not be recorded by AppSignal.
  # For more information see our docs:
  # https://docs.appsignal.com/ruby/configuration/ignore-errors.html
  # config.ignore_errors << "MyCustomError"
end

Appsignal.start

# puts Appsignal.active?

use ::Rack::Events, [Appsignal::Rack::EventHandler.new]
use Appsignal::Rack::InstrumentationMiddleware

run App.freeze.app
