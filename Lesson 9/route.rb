# frozen_string_literal: true

require_relative './instance_counter.rb'
require_relative './validation.rb'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations

  validate :first, :presence
  validate :last, :presence
  validate :stations, :type, Route

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

  protected

  def station_list
    @stations.each do |r|
      p r
    end
  end
end
