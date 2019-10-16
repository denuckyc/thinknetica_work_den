# frozen_string_literal: true

module Menu
  class << self
    def main_menu
      puts
      puts 'Main Menu'
      puts
      puts 'Enter \'1\' to check Station menu.'
      puts 'Enter \'2\' to check Train menu.'
      puts 'Enter \'3\' to check Route menu.'
      puts 'Enter \'4\' to check Carriage menu.'
      puts 'Enter \'0\' to exit.'
    end

    def station_menu
      puts
      puts 'Station control:'
      puts
      puts 'Enter \'1\' to create station.'
      puts 'Enter \'2\' to see station list and trains on it.'
      puts 'Enter \'0\' to exit in Main Menu.'
    end

    def train_menu
      puts
      puts 'Train control:'
      puts
      puts 'Enter \'1\' to create train.'
      puts 'Enter \'2\' to take route.'
      puts 'Enter \'3\' to move train on route.'
      puts 'Enter \'4\' to see carriage list of train.'
      puts 'Enter \'0\' to in exit Main Menu.'
    end

    def route_menu
      puts
      puts 'Route control:'
      puts
      puts 'Enter \'1\' to create route.'
      puts 'Enter \'2\' to add station in route.'
      puts 'Enter \'3\' to remove station in route.'
      puts 'Enter \'0\' to exit in Main Menu.'
    end

    def carriage_menu
      puts
      puts 'Carriage cotrol:'
      puts
      puts 'Enter \'1\' to create carriage.'
      puts 'Enter \'2\' to add carriage.'
      puts 'Enter \'3\' to remove carriage.'
      puts 'Enter \'4\' to take seat in carriage or fill in carriage.'
      puts 'Enter \'0\' to exit in Main Menu.'
    end

    def create_train_list
      puts 'Enter \'1\' to create passenger train.'
      puts 'Enter \'2\' to create cargo train.'
    end

    def seat_or_fill_list
      puts 'Enter \'1\' to fill in cargo carriage.'
      puts 'Enter \'2\' to take seat in passenger carriage.'
    end

    def create_choose
      puts 'Enter \'1\' to create cargo carriage.'
      puts 'Enter \'2\' to crate passenger carriage.'
      puts 'Enter \'0\' to exit in Carriage cotrol.'
    end

    def add_carriage_choose
      puts 'Enter \'1\' to add cargo carriage.'
      puts 'Enter \'2\' to add passenger carriage.'
      puts 'Enter \'0\' to exit in Carriage cotrol.'
    end
  end
end
