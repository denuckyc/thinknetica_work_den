require_relative './instance_counter.rb'

class Route
  include InstanceCounter
    
  attr_reader :stations
    
  def initialize(first, last)
    @stations = [first, last]
    validate!
  end
    
  def add_station(station)
    @stations.insert(-2, station)
  end
    
  def delete_station(station)
    @stations.delete(station)
  end

  def validate!
    raise 'Does not match class.' unless (stations.first.instance_of? Station) || (stations.last.instance_of? Station)
  end

  protected

  def station_list
    @stations.each do |r|
      p r
    end
  end
end
