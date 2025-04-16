require 'bundler'
Bundler.require

# Set up root path
APP_ROOT = File.expand_path('..', __dir__)

# Load database configuration
require_relative 'database'

# Load all model files
Dir[File.join(APP_ROOT, 'models', '*.rb')].each { |file| require file }

# Load all controller files
Dir[File.join(APP_ROOT, 'controllers', '*.rb')].each { |file| require file } 