require_relative 'base_controller'

class HelloController < BaseController
  def hello
    Appsignal.set_action("HelloController#hello")

    # not able to see the query in the appsignal dashboard
    result = User.create_user(name: "John Doe", email: "john@example.com")
    # puts result

    # not able to see the query in the appsignal dashboard
    result = User.delete_user(1)
    # puts result

    sleep 2
    { message: "Hello, World!" }
  end

  instrument_method :hello
end
