class CargoCarriage
  attr_reader :carriage_number
  #заменил тип на номер вагона
  def initialize(carriage_number = rand(1..20))
    @carriage_number = carriage_number
  end
end
