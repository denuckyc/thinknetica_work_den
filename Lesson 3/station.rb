class Station
  @@trains = {}
  def initialize(station_name)
      @station_name = station_name
  end
  
  def trains_on_station_at_that_moment(train, station_name)
      time = Time.now
      @@trains[train] = { station_name: @station_name, time: time }
      p @@trains
  end
  
  def trains_count(type)
      @@trains.count { |train| train.type == type }
  end
  
  def send_train(train)
      @@trains.delete(train)
  end
end
