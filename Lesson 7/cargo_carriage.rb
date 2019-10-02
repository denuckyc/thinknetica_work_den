require_relative './company.rb'
require_relative './valid_cargo.rb'

class CargoCarriage
  include Company
  include ValidCargo
  
  attr_reader :carriage_number, :available_volume

  def initialize(carriage_number = rand(1..20), overall_volume)
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