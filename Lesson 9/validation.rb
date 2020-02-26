module Validation
  NO_VALIDATION = 'There is no such check!'.freeze
  VALIDATION_TYPES = %i[presence format type].freeze
  PRESENCE_ERROR = 'Object is empty!'.freeze
  FORMAT_ERROR = 'Object does not match format!'.freeze
  TYPE_ERROR = 'Type mismatch!'.freeze

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :settings
    def validate(name, validation_type, option = nil)
      @settings ||= []
      raise NO_VALIDATION unless VALIDATION_TYPES.include? validation_type

      @settings << { param: name, validation_type: validation_type, option: option }
    end
  end

  module InstanceMethods
    def validate!
      self.class.settings.each do |setting|
        param_value = instance_variable_get("@#{setting[:param]}".to_sym)
        method_name = "#{setting[:validation_type]}_validation"
        send method_name, param_value, setting[:option]
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    private

    def presence_validation(param_value)
      raise PRESENCE_ERROR if param_value.nil? || param_value == ''
    end

    def format_validation(param_value, regex)
      raise FORMAT_ERROR unless regex.match? param_value
    end

    def type_validation(param_value, type)
      raise TYPE_ERROR if param_value.class != type
    end
  end
end
