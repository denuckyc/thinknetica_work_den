# frozen_string_literal: true

require_relative './train.rb'
require_relative './route.rb'
require_relative './passenger_carriage.rb'
require_relative './cargo_carriage.rb'
require_relative './passenger_train.rb'
require_relative './cargo_train.rb'
require_relative './station.rb'
require_relative './menu.rb'
require_relative './validation.rb'

class Main
  attr_reader :stations, :trains, :routes
  INVALID_OPTION = 'It is not an option. Try again.'

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @cargo_carriages = []
    @passenger_carriages = []
  end

  def main_menu
    loop do
      Menu.main_menu
      choice = gets.chomp.to_i

      case choice
      when 1 then station_menu
      when 2 then train_menu
      when 3 then route_menu
      when 4 then carriage_menu
      when 0 then abort('Stop the program.')
      else puts INVALID_OPTION
      end
    end
  end

  def station_menu
    loop do
      Menu.station_menu
      choice = gets.chomp.to_i

      case choice
      when 1 then create_station
      when 2 then list_stations_and_trains_on_it
      when 0 then break
      else puts INVALID_OPTION
      end
    end
  end

  def train_menu
    loop do
      Menu.train_menu
      choice = gets.chomp.to_i

      case choice
      when 1 then create_train
      when 2 then take_the_route
      when 3 then move_train
      when 4 then carriage_list_of_train
      when 0 then break
      else puts INVALID_OPTION
      end
    end
  end

  def route_menu
    loop do
      Menu.route_menu
      choice = gets.chomp.to_i

      case choice
      when 1 then create_route
      when 2 then add_station_in_route
      when 3 then remove_station_in_route
      when 0 then break
      else puts INVALID_OPTION
      end
    end
  end

  def carriage_menu
    loop do
      Menu.carriage_menu
      choice = gets.chomp.to_i

      case choice
      when 1 then create_carriage
      when 2 then add_carriage
      when 3 then delete_carriage
      when 4 then take_seat_or_fill_carriage
      when 0 then break
      else puts INVALID_OPTION
      end
    end
  end

  def create_station
    puts 'Enter the station name'
    @stations << Station.new(gets.chomp.to_s)
  end

  def create_train
    Menu.create_train_list
    input = gets.chomp.to_i
    case input
    when 1 then @trains << PassengerTrain.new(create_train_number('number'))
    when 2 then @trains << CargoTrain.new(create_train_number('number'))
    end
  rescue RuntimeError => e
    show_error(e)
    retry
  else
    puts "Train created: #{@trains.last}."
  end

  def create_train_number(number)
    puts "Enter #{number} of train."
    gets.to_s
  end

  def show_error(err)
    puts
    puts 'Something went wrong! Please, try again. ERROR:'
    puts err.message
  end

  def create_route
    show_array(@stations, 'To crate route enter two station of this list:')
    puts 'Enter number of the first station.'
    number_first = gets.chomp.to_i
    first = @stations[number_first]
    puts 'Enter number of the last station.'
    number_last = gets.chomp.to_i
    last = @stations[number_last]
    @routes << Route.new(first, last)
  rescue RuntimeError => e
    show_error(e)
    retry
  else
    puts "Route created: #{@routes.last}."
  end

  def add_station_in_route
    show_array(@routes, 'Choose the route on that you need to add station.')
    number_route = gets.chomp.to_i
    current_route = @routes[number_route]
    show_array(@stations, 'Enter number of the station.')
    number_station = gets.chomp.to_i
    current_route.add_station(@stations[number_station])
  rescue RuntimeError => e
    show_error(e)
    retry
  else
    puts "Route created: #{@routes.last}."
  end

  def remove_station_in_route
    show_array(@routes, 'Choose the route on that you need to remove station.')
    number_route = gets.chomp.to_i
    current_route = @routes[number_route]
    show_array(@stations, 'Enter number of the station.')
    number_station = gets.chomp.to_i
    current_route.delete_station(@stations[number_station])
  end

  def take_the_route
    show_array(@routes, 'Choose route for train.')
    number_route = gets.chomp.to_i
    current_route = @routes[number_route]
    show_array(@trains, 'Choose train.')
    number_train = gets.chomp.to_i
    current_train = @trains[number_train]
    current_train.take_route(current_route)
  end

  def create_carriage
    loop do
      Menu.create_choose
      choose = gets.chomp.to_i

      case choose
      when 1 then create_cargo_carriage
      when 2 then create_passenger_carriage
      when 0 then break
      else puts INVALID_OPTION
      end
    end
  end

  def create_cargo_carriage
    puts 'Enter number corriage.'
    number_carriage = gets.chomp.to_i
    puts 'Enter overall volume.'
    overall_volume = gets.chomp.to_i
    carriage = CargoCarriage.new(overall_volume, number_carriage)
    @cargo_carriages << carriage
  end

  def create_passenger_carriage
    puts 'Enter number corriage.'
    number_carriage = gets.chomp.to_i
    puts 'Enter total seats.'
    total_seats = gets.chomp.to_i
    carriage = PassengerCarriage.new(total_seats, number_carriage)
    @passenger_carriages << carriage
  end

  def add_carriage
    loop do
      Menu.add_carriage_choose
      choose = gets.chomp.to_i

      case choose
      when 1 then add_cargo_carriage
      when 2 then add_passenger_carriage
      when 0 then break
      else puts INVALID_OPTION
      end
    end
  end

  def add_cargo_carriage
    show_array(@trains, 'Choose train that need to add corriage.')
    number_train = gets.chomp.to_i
    show_array(@cargo_carriages, 'Choose carriage that need to add.')
    number_carriage = gets.chomp.to_i
    @trains[number_train].add_carriage(@cargo_carriages[number_carriage])
  rescue RuntimeError => e
    show_error(e)
    retry
  else
    puts "Number of carriage = #{@trains[number_train].count_carriages}"
  end

  def add_passenger_carriage
    show_array(@trains, 'Choose train that need to add corriage.')
    number_train = gets.chomp.to_i
    show_array(@passenger_carriages, 'Choose carriage that need to add.')
    number_carriage = gets.chomp.to_i
    @trains[number_train].add_carriage(@passenger_carriages[number_carriage])
  rescue RuntimeError => e
    show_error(e)
    retry
  else
    puts "Number of carriage = #{@trains[number_train].count_carriages}"
  end

  def delete_carriage
    show_array(@trains, 'Choose train that need to remove corriage.')
    number_train = gets.chomp.to_i
    @trains[number_train].remove_carriage unless @trains[number_train].carriages.empty?
    puts "Number of carriage = #{@trains[number_train].count_carriages}"
  end

  def move_train
    show_array(@trains, 'Choose train that you need to move.')
    number_train = gets.chomp.to_i
    puts 'Enter \'1\' to move forward or \'2\' to move backword.'
    input = gets.chomp.to_i
    case input
    when 1 then @trains[number_train].forward
    when 2 then @trains[number_train].backward
    end
  end

  def list_stations_and_trains_on_it
    show_array(@stations, 'Enter number of station to view which trains on it.')
    number_station = gets.chomp.to_i
    stations[number_station].each_train do |train|
      puts "Number of train #{train.number}:
      (type - #{train.type}, number of carriages - #{train.count_carriages})"
    end
  end

  def take_seat_or_fill_carriage
    Menu.seat_or_fill_list
    input = gets.chomp.to_i
    case input
    when 1 then fill_carriage
    when 2 then take_seat
    end
  end

  def fill_carriage
    show_array(@cargo_carriages, 'Number of carriage you need to fill in.')
    number = gets.chomp.to_i
    current_carriage = @cargo_carriages[number]
    puts 'Enter volume.'
    volume = gets.chomp.to_i
    current_carriage.fill_carriage(volume)
    show_array(@cargo_carriages)
  end

  def take_seat
    show_array(@passenger_carriages, 'Number of carriage you need to take seat.')
    number = gets.chomp.to_i
    @passenger_carriages[number].take_seat
    show_array(@cargo_carriages)
  end

  def carriage_list_of_train
    show_array(@trains, 'Select number of train to display the carriage list.')
    number = gets.chomp.to_i
    if @trains[number].type == :cargo
      @trains[number].each_carriage do |carriage|
        puts "(carriage #{carriage.carriage_number},
        available volume - #{carriage.available_volume},
        occupied volume - #{carriage.occupied_volume})"
      end
    elsif @trains[number].type == :passenger
      @trains[number].each_carriage do |carriage|
        puts "(carriage - #{carriage.carriage_number},
        available seats - #{carriage.available_seats},
        occupied seats - #{carriage.occupied_seats})"
      end
    end
  end

  def show_array(array, title = nil)
    puts title if title
    array.each_with_index do |item, index|
      puts "#{index} — #{item}"
    end
  end
end

main = Main.new
main.main_menu
