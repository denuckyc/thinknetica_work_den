class Station
    
  attr_reader :name, :trains
  @@stations = []
    
  def initialize(name)
    @name = name
    @trains = []
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
end
