# frozen_string_literal: true

require_relative './company.rb'
require_relative './validation.rb'

class PassengerCarriage
  include Company
  include Validation

  attr_reader :passenger_number, :available_seats

  validate :passenger_number, :format, /^\d{1,2}$/i

  def initialize(total_seats, passenger_number = rand(1..20))
    @passenger_number = passenger_number
    @total_seats = total_seats
    @available_seats = @total_seats
    validate!
  end

  def take_seat
    @available_seats -= 1 if @available_seats.positive?
  end

  def occupied_seats
    @total_seats - @available_seats
  end
end
