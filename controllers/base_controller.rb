class BaseController
  def self.instrument_method(method_name)
    original_method = instance_method(method_name)

    define_method(method_name) do |*args, &block|
      Appsignal.instrument(
        "#{self.class.name}##{method_name}",
        "#{self.class.name}##{method_name}"
      ) do
        original_method.bind(self).call(*args, &block)
      end
    end
  end
end
