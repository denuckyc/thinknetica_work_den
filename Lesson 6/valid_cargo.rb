module ValidCargo

NUMBER_FORMAT = /^\d{1,2}$/i

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise "Number has invalid format. You must enter value from 0 to 20." if carriage_number.to_s !~ NUMBER_FORMAT
  end
end
