class Train
    
  attr_reader :number, :type
  attr_accessor :speed, :carriages_number
  
  def initialize(number, type, carriages_number)
    @number = number
    @type = type
    @carriages_number = carriages_number
    @speed = 0
  end
    
  def gather_speed(new_speed)
    @speed = new_speed
  end
    
  def stop
    @speed = 0
  end
  
  def is_moving?
    @speed > 0
  end
  
  def add_carriage
    @carriages_number += 1 unless is_moving?
  end
    
  def remove_carriage
    @carriages_number -= 1 unless is_moving? || @carriages_number == 0
  end
  
  def take_route(route)
    @route = route
    @at_station = 0
    @route.stations.first.take_train(self)
  end
    
  def current_station
    @route.stations[@at_station]
  end
    
  def previous_station
    if @route.stations.first == current_station
      return nil
    else
      @route.stations[@at_station - 1]
    end
  end
    
  def next_station
    if @route.stations.last == current_station
      return nil
    else
      @route.stations[@at_station + 1]
    end
  end
    
  def forward
    return unless next_station
    
    current_station.depart_train(self)
    next_station.take_train(self)
    @at_station += 1
  end
    
  def backward
    return unless previous_station
    
    current_station.depart_train(self)
    previous_station.take_train(self)
    @at_station -= 1
  end
    
  def show_route
    [previous_station, current_station, next_station]
  end
end
