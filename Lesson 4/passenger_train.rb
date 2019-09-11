class PassengerTrain < Train
  def initialize(number, type = :passenger)
    super
  end
  
  def add_carriage(carriage)
    super if carriage.type == type
  end
end
