# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number, type = :passenger)
    super
  end

  def add_carriage(carriage)
    super if carriage.instance_of? PassengerCarriage
  end
end
