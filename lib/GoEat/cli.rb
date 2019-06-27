require 'thor'
require 'readline'

module GoEat
  class CLI < Thor
    # The argument feature is not implemented yet
    def start
      Running.start_no_arg
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

      def start_no_arg
        puts "WELCOME TO Go-Eat APP"
        puts "You have 5 stores and 3 drivers around you now"
        puts "What do you want to do???"
        show_menu
        menu_next_no_arg
      end

      def menu_next_no_arg
        # Creating default objects
        # with random coordinates
        # map is between 0 and 20
        # 1 user
        user = User.new(nil, nil )
        Randomize.random_coordinate(user, 0, 20)
        # 3 Stores and a store book
        store_book = StoreBook.new
        store1 = Store.new("Siomay Elfin", nil, nil)
        store_book << store1
        Randomize.random_coordinate(store1, 0, 20)
        store1.create_menu
        store1.add_menu("Siomay", 3000)
        store1.add_menu("Pempek", 5000)
        store1.add_menu("Tekwan", 7000)

        store2 = Store.new("Baskin Aweu", 4, nil)
        store_book << store2
        Randomize.random_coordinate(store2, 0, 20)
        store2.create_menu
        store2.add_menu("Hejo", 6000)
        store2.add_menu("Oren", 8000)
        store2.add_menu("Merah", 4000)
        store2.add_menu("Koneng", 9000)

        store3 = Store.new("Crisbar", 2, nil)
        store_book << store3
        Randomize.random_coordinate(store3, 0, 20)
        store3.create_menu
        store3.add_menu("Geprek Matah", 10000)
        store3.add_menu("Geprek Manis", 13000)

        # 5 Drivers and a driver book
        driver_book = DriverBook.new
        driver1 = Driver.new("Asep Sutarman", nil, nil)
        driver_book << driver1
        Randomize.random_coordinate(driver1, 0, 20)
        driver2 = Driver.new(" Jajang Sutisna", nil, nil)
        driver_book << driver2
        Randomize.random_coordinate(driver2, 0, 20)
        driver3 = Driver.new("Chris Lennon", nil, nil)
        driver_book << driver3
        Randomize.random_coordinate(driver3, 0, 20)
        driver4 = Driver.new("Aher", nil, nil)
        driver_book << driver4
        Randomize.random_coordinate(driver4, 0, 20)
        driver5 = Driver.new("Toru Watanabe", nil, nil)
        driver_book << driver5
        Randomize.random_coordinate(driver5, 0, 20)

        # Create a map
        map = Maps.new(20, 20)
        map.generate_map
        # Cast objects created to map
        map.add_to_map(user)
        map.add_book_to_map(driver_book)
        map.add_book_to_map(store_book)

        # Create a history book
        history_book = HistoryBook.new

        # Utilizing loop
        input = nil
        # Loop over and over until get a 0 input
        while true # user input != 0
          input = Readline.readline("Pick Your number: ", true).strip
          if input == 0
            goodbye
          elsif input == 1
            map.draw_map
          elsif input == 2
            GoEat::Create_Order.run_order(store_book, driver_book, history_book, user)
          elsif input == 3
            GoEat::History.show_history(history_book)
          end
        end
      end

      def goodbye
        puts "Thank ypu for choosing us!!"
        exit
      end
    end

  end
end
