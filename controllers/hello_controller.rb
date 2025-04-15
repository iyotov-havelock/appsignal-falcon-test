require_relative 'base_controller'

class HelloController < BaseController
  def hello
    Appsignal.send_error(RuntimeError.new("foo"))
    sleep 3
    { message: "Hello, World!" }
  end

  instrument_method :hello
end
