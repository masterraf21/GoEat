require 'thor'

module GoEat
  class CLI < Thor
    # The argument feature is not implemented yet
    def start
      Running.start
    end
  end

  class Running
    class << self
      def show_menu
        puts "1. Show Map"
        puts "2. Make Order"
        puts "3. Show History"
        puts "0. Exit"
      end

      def start
        puts "WELCOME TO Go-Eat APP"
        puts "You have 5 stores and 3 drivers around you now"
        puts "What do you want to do???"
        show_menu
        select_menu
      end

      def select_menu
        input = nil

        # Loop over and over until get a 0 input
        while true # user input != 0


        end

      end
    end

  end
end
