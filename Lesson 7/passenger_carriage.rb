require_relative './company.rb'
require_relative './valid_cargo.rb'

class PassengerCarriage
  include Company
  include ValidCargo
	
  attr_reader :carriage_number, :available_seats

  def initialize(carriage_number = rand(1..20), total_seats)
    @carriage_number = carriage_number
    @total_seats = total_seats
    @available_seats = @total_seats
    validate!
  end

  def take_seat
    @available_seats -= 1 if @available_seats > 0
  end

  def occupied_seats
    @total_seats - @available_seats
  end	
end