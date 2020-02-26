module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      history_var_name = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}_history".to_sym) { instance_variable_get(history_var_name) }
      define_method("#{name}=".to_sym) do |value|
        var_value = instance_variable_get(var_name)
        history_value = instance_variable_get(history_var_name)
        instance_variable_set(history_var_name, []) unless instance_variable_defined? history_var_name

        history_value << var_value unless var_value.nil?
        instance_variable_set(var_name, value)
      end
    end
  end

  def strong_attr_accessor(name, attr_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'Class incompatibility!' if value.class != attr_class

      instance_variable_set(var_name, value)
    end
  end
end
