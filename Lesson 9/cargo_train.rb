# frozen_string_literal: true

require_relative './validation.rb'

class CargoTrain < Train
  include Validation

  validate :name, :format, /^[a-z\d]{3}-?[a-z\d]{2}$/
  validate :type, :presence

  def initialize(name, type = :cargo)
    super
  end

  def add_carriage(carriage)
    super if carriage.instance_of? CargoCarriage
  end
end
