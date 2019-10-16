# frozen_string_literal: true

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
    'Does not match class.' unless
      (stations[0].is_a? Station) || (stations[-1].is_a? Station)
  end

  protected

  def station_list
    @stations.each do |r|
      p r
    end
  end
end
