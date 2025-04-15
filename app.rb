require 'roda'
require_relative 'controllers/hello_controller'

class App < Roda
  plugin :json

  route do |r|
    # GET / - Hello World endpoint
    r.root do
      hello_controller = HelloController.new
      hello_controller.hello
    end
  end
end 