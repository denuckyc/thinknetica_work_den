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
    @route.route_list[0].take_train(self)
  end
    
  def current_station
    @current_station = @route.route_list.find { |station| station.trains.include?(self) }
  end
    
  def previous_station
    if current_station == @route.route_list[0]
      false
    else
      @previous_station = @route.route_list[@route.route_list.index(current_station) - 1]
    end
  end
    
  def next_station
    if current_station == @route.route_list[-1]
      false
    else
      @next_station = @route.route_list[@route.route_list.index(current_station) + 1]
    end
  end
    
  def motion(station)
    @current_station.depart_train(self)
    station.take_train(self)
  end
    
  def forward
    if next_station
      motion(@next_station)
    else
      false
    end
  end
    
  def backward
    if previous_station
      motion(@previous_station)
    else
      false
    end
  end
    
  def show_route
    [previous_station, current_station, next_station]
  end
end
