require_relative './company.rb'
require_relative './instance_counter.rb'

class Train
  include Company
  include InstanceCounter

  attr_reader :number, :type
  attr_accessor :speed, :carriages

  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/

  @@trains = {}
  
  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
    @@trains[number] = self
    validate!
  end

  def valid?
    validate! 
    true
  rescue
    false
  end

  def self.find(number)
    @@trains[number]
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

  def validate!
    raise "Number of train does not correct." if number !~ NUMBER_FORMAT
  end

  def show_route
    [previous_station, current_station, next_station]
  end
  
  def last_station?
    @route.stations.last == current_station
  end

  def first_station?
    @route.stations.first == current_station
  end
  
  def current_station
    @route.stations[@at_station]
  end
  
  def previous_station
    @route.stations[@at_station - 1] unless first_station?
  end
  
  def next_station
    @route.stations[@at_station + 1] unless last_station?
  end
end
