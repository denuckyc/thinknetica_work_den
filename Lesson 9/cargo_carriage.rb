# frozen_string_literal: true

require_relative './company.rb'
require_relative './validation.rb'

class CargoCarriage
  include Company
  include Validation

  attr_reader :carriage_number, :available_volume

  validate :carriage_number, :format, /^\d{1,2}$/i

  def initialize(overall_volume, carriage_number = rand(1..20))
    @carriage_number = carriage_number
    @overall_volume = overall_volume
    @available_volume = @overall_volume
    validate!
  end

  def fill_carriage(volume)
    @available_volume -= volume if volume <= @available_volume
  end

  def occupied_volume
    @overall_volume - @available_volume
  end
end
