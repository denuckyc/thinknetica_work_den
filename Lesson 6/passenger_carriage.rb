require_relative './company.rb'
require_relative './valid_cargo.rb'

class PassengerCarriage
  include Company
  include ValidCargo
	
  attr_reader :carriage_number

  def initialize(carriage_number = rand(1..20))
    @carriage_number = carriage_number
    validate!
  end  
end
