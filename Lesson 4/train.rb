class Train
    
  attr_reader :number, :type
  attr_accessor :speed, :carriages
  
  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
  end
    
  def gather_speed(new_speed)
    @speed = new_speed
  end
    
  def stop
    @speed = 0
  end
  
  def add_carriage(carriage)
      @carriages << carriage if @speed.zero?
  end
  
  def remove_carriage
    @carriages.pop if @carriages.size > 0 && @speed.zero?
  end
  
  def count_carriages
    @carriages.size
  end
  
  def take_route(route)
    @route = route
    @at_station = 0
    @route.stations.first.take_train(self)
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
  
  private
  # Т.к. эти методы не используются за переделами этого класса и привязаны к поезду.
  def show_route
    [previous_station, current_station, next_station]
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
end
