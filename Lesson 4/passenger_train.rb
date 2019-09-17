class PassengerTrain < Train
  def initialize(number, type = :passenger)
    super
  end
  
  def add_carriage(carriage)
  	#использую instance_of? вместо is_a?, т.к. в данном случае одобнее произвордить проверку,
  	#что объект является экземпляром именно конкретного класса.
    super if carriage.instance_of? PassengerCarriage
  end
end
