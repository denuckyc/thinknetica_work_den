class Route
    
  attr_reader :route_list
    
  def initialize(first, last)
    @route_list = [first, last]
  end
    
  def add_station(station)
    @route_list.insert(@route_list.size - 1, station)
  end
    
  def delete_station(station)
    @route_list.delete(station)
  end
    
  def station_list
    @route_list.each do |r|
      p r
    end
  end
end
