require_relative './instance_counter.rb'

class Station
  include InstanceCounter
    
  attr_reader :name, :trains
  @@stations = []
    
  def initialize(name)
    @name = name.to_s
    @trains = []
    validate!
    @@stations << self
  end
    
  def take_train(train)
    @trains << train
  end
    
  def trains_list(type)
    @trains.select { |train|  train if train.type == type }
  end
    
  def depart_train(train)
    @trains.delete(train)
  end
  
  def self.all
    @@stations
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name must contain al least 1 symbols" if name.length < 1
  end
  
  def validate?
    validate!
    true
  rescue
    false
  end    
end
