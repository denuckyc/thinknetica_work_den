# frozen_string_literal: true

module ValidCargo
  NUMBER_FORMAT = /^\d{1,2}$/i.freeze

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    invalid_value = 'Number has invalid format. Enter value from 0 to 20.'
    raise invalid_value if carriage_number.to_s !~ NUMBER_FORMAT
  end
end
