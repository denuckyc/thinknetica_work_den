require_relative './train.rb'
require_relative './route.rb'
require_relative './passenger_carriage.rb'
require_relative './cargo_carriage.rb'
require_relative './passenger_train.rb'
require_relative './cargo_train.rb'
require_relative './station.rb'

class Main
  attr_reader :stations, :trains, :routes
    
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @cargo_carriages = []
    @passenger_carriages = []
  end

  def main_menu
    loop do
      puts 'Enter \'1\' to create station.'
      puts 'Enter \'2\' to create train.'
      puts 'Enter \'3\' to create route.'
      puts 'Enter \'4\' to add station in route.'
      puts 'Enter \'5\' to remove station in route.'
      puts 'Enter \'6\' to take route.'
      puts 'Enter \'7\' to add carriage.'
      puts 'Enter \'8\' to remove carriage.'
      puts 'Enter \'9\' to move train on route.'
      puts 'Enter \'10\' to see station list and trains on it.'
      puts 'Enter \'11\' to take seat in carriage or fill in carriage.'
      puts 'Enter \'12\' to see carriage list of train.'
      puts 'Enter \'0\' to exit.'
      choice = gets.chomp.to_i

      case choice
      when 1 then create_station
      when 2 then create_train
      when 3 then create_route
      when 4 then add_station_in_route
      when 5 then remove_station_in_route
      when 6 then get_route_to_train
      when 7 then add_carriage
      when 8 then delete_carriage
      when 9 then move_train
      when 10 then list_stations_and_trains_on_it
      when 11 then take_seat_or_fill_carriage
      when 12 then carriage_list_of_train  
      when 0 then abort('Stop the program.')
      else puts 'It is not an option. Try again.'
      end
    end
  end
  
  def create_station
    puts 'Enter the station name'
    @stations << Station.new(gets.chomp.to_s)
  end
  
  def create_train
    puts 'Enter \'1\' to create passenger train.'
    puts 'Enter \'2\' to create cargo train.'
    input = gets.chomp.to_i
    case input
    when 1 then
      puts 'Enter number of train.'
      @trains << PassengerTrain.new(gets.chomp)
    when 2 then
      puts 'Enter number of train.'
      @trains << CargoTrain.new(gets.chomp)
    end
  rescue RuntimeError => e
    show_error(e)
    retry
  else
    puts "Train created: #{@trains.last}."  
  end
  
  def show_error(err)
    puts
    puts 'Something went wrong! Please, try again. ERROR:'
    puts err.message
  end


  def create_route
    puts 'To crate route enter two station of this list:'
    @stations.each.with_index { |station, index| puts "Number #{index} - #{station.name}" }
    puts 'Enter number of the first station.'
    number_first = gets.chomp.to_i
    first = @stations[number_first]
    puts 'Enter number of the last station.'
    number_last = gets.chomp.to_i
    last = @stations[number_last]
    @routes << Route.new(first, last)
  end
  
  def add_station_in_route
    @routes.each.with_index { |route, index| puts "Number #{index} - #{route.stations.map { |station| station.name} }"  }
    puts 'Choose the route on that you need to add station.'
    number_route = gets.chomp.to_i
    current_route = @routes[number_route]
    puts 'Enter number of the station.'
    @stations.each.with_index { |station, index| puts "Number #{index} - #{station.name}" }
    number_station = gets.chomp.to_i
    current_route.add_station(@stations[number_station])
  end
  
  def remove_station_in_route
    @routes.each.with_index { |route, index| puts "Number #{index} - #{route.stations.map { |station| station.name} }"  }
    puts 'Choose the route on that you need to remove station.'
    number_route = gets.chomp.to_i
    current_route = @routes[number_route]
    puts 'Enter number of the station.'
    @stations.each.with_index { |station, index| puts "Number #{index} - #{station.name}" }
    number_station = gets.chomp.to_i
    current_route.delete_station(@stations[number_station])
  end
  
  def get_route_to_train
    puts 'Choose route for train.'
    @routes.each.with_index { |route, index| puts "Number #{index} - #{route.stations.map { |station| station.name} }"  }
    number_route = gets.chomp.to_i
    current_route = @routes[number_route]
    puts 'Choose train.'
    @trains.each.with_index { |train, index| puts "Number #{index}: #{train.number}(#{train.type})" }
    number_train = gets.chomp.to_i
    current_train = @trains[number_train]
    current_train.take_route(current_route)
  end
  
  def add_carriage
    @trains.each.with_index { |train, index| puts "Number #{index}: #{train.number}(#{train.type})" }
    puts 'Choose train that need to add corriage.'
    number_train = gets.chomp.to_i
    if @trains[number_train].type == :cargo
      puts 'Enter number corriage.'
      number_carriage = gets.chomp.to_i
      puts 'Enter overall volume.'
      overall_volume = gets.chomp.to_i
      carriage = CargoCarriage.new(number_carriage, overall_volume)
      @cargo_carriages << carriage
      @trains[number_train].add_carriage(carriage)
    elsif @trains[number_train].type == :passenger
      puts 'Enter number corriage.'
      number_carriage = gets.chomp.to_i
      puts 'Enter total seats.'
      total_seats = gets.chomp.to_i
      carriage = PassengerCarriage.new(number_carriage, total_seats)
      @passenger_carriages << carriage
      @trains[number_train].add_carriage(carriage)
    end
  rescue RuntimeError => e
    show_error(e)
    retry
  else
    puts "Number of carriage = #{@trains[number_train].count_carriages}"
  end
  
  def delete_carriage
    @trains.each.with_index { |train, index| puts "Number #{index}: #{train.number}(#{train.type})" }
    puts 'Choose train that need to remove corriage.'
    number_train = gets.chomp.to_i
    @trains[number_train].remove_carriage if @trains[number_train].carriages.length != 0
    puts "Number of carriage = #{@trains[number_train].count_carriages}"
  end
  
  def move_train
    @trains.each.with_index { |train, index| puts "Number #{index}: #{train.number}(#{train.type})" }
    puts 'Choose train that you need to move.'
    number_train = gets.chomp.to_i
    puts 'Enter \'1\' to move forward or \'2\' to move backword.'
    input = gets.chomp.to_i
    case input
    when 1 then @trains[number_train].forward
    when 2 then @trains[number_train].backward
    end
  end
  
  def list_stations_and_trains_on_it
    @stations.each.with_index { |station, index| puts "Number #{index} - #{station.name}" }
    puts 'Enter number of station to view which trains on it.'
    number_station = gets.chomp.to_i
    stations[number_station].each_train { |train| puts "Number of train #{train.number}: (type - #{train.type}), number of carriages - #{train.count_carriages}"}
  end

  def take_seat_or_fill_carriage
    puts 'Enter \'1\' to fill in cargo carriage.'
    puts 'Enter \'2\' to take seat in passenger carriage.'
    input = gets.chomp.to_i
    case input
    when 1 then
      @cargo_carriages.each.with_index { |carriage, index| puts "Number #{index}: (carriage - #{carriage.carriage_number}, available volume - #{carriage.available_volume}, occupied volume - #{carriage.occupied_volume})" }
      puts 'Enter number of carriage that you need to fill in.'
      number = gets.chomp.to_i
      current_carriage = @cargo_carriages[number]
      puts 'Enter volume.'
      volume = gets.chomp.to_i
      current_carriage.fill_carriage(volume)       
      @cargo_carriages.each { |carriage| puts "(carriage #{carriage.carriage_number}, available volume - #{carriage.available_volume}, occupied volume - #{carriage.occupied_volume})" }
    when 2 then
      @passenger_carriages.each.with_index { |carriage, index| puts "Number #{index}: (carriage - #{carriage.carriage_number}, available seats - #{carriage.available_seats}, ccupied seats - #{carriage.occupied_seats})" }
      puts 'Enter number of carriage that you need to take seat.'
      number = gets.chomp.to_i
      @passenger_carriages[number].take_seat
      @passenger_carriages.each { |carriage| puts "(carriage - #{carriage.carriage_number}, available seats - #{carriage.available_seats}, ccupied seats - #{carriage.occupied_seats})" }
    end          
  end  

  def carriage_list_of_train 
    @trains.each.with_index { |train, index| puts "Number #{index}: #{train.number}(#{train.type})" }
    puts 'Select number of train to display the carriage list.'
    number = gets.chomp.to_i
    if @trains[number].type == :cargo
      @trains[number].each_carriage { |carriage| puts "(carriage #{carriage.carriage_number}, available volume - #{carriage.available_volume}, occupied volume - #{carriage.occupied_volume})" } 
    elsif @trains[number].type == :passenger
      @trains[number].each_carriage { |carriage| puts "(carriage - #{carriage.carriage_number}, available seats - #{carriage.available_seats}, ccupied seats - #{carriage.occupied_seats})" }
    end
  end
  

end

main = Main.new
main.main_menu
