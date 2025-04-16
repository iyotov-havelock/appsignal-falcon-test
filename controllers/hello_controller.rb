require_relative 'base_controller'

class HelloController < BaseController
  def hello
    Appsignal.set_action("HelloController#hello")
    sleep 3
    { message: "Hello, World!" }
  end

  instrument_method :hello
end
