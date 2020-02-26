# frozen_string_literal: true

require_relative './instance_counter.rb'
require_relative './validation.rb'

class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :trains

  validate :name, :format, /^[a-z]+$/i

  @@stations = []

  def initialize(name)
    @name = name.capitalize
    @trains = []
    validate!
    @@stations << self
  end

  def take_train(train)
    @trains << train
  end

  def trains_list(type)
    @trains.select { |train| train if train.type == type }
  end

  def depart_train(train)
    @trains.delete(train)
  end

  def stations
    @@stations
  end

  def self.all
    @@stations
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  def to_s
    @name
  end
end
