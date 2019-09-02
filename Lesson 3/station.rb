class Station
    
  attr_reader :name, :trains
    
  def initialize(name)
    @name = name
    @trains = []
  end
    
  def take_train(train)
    @trains << train
  end
    
  def trains_on_station_at_that_moment
    time = Time.now
    p time, @name, @trains
  end
    
  def trains_list(type)
    return @trains.collect { |train|  train if train.type == type }
  end
    
  def depart_train(train)
    @trains.delete(train)
  end
end
