module GoEat
  # Custom data object
  Coordinate = Struct.new(:x, :y)
  Item = Struct.new(:name, :price)


  # Note for initialization for all objects
  # The coordinate for the undefined or pre-random object will be assigned with 'nil' value
  # This assumption was made to not confusing the later operation
  # 'nil' means not-defined-yet and '0' value means the coordinate is at '0' point

  # To keep tracking of every instance Driver and Store class made
  # I create a container class(inherit from array) used for containing
  # every driver and store instance(s) created
  # So, when initiating a new Driver or Store object
  # i will use :
  # DriverBook(object) << Driver.new(...) and StoreBook(object) << Store.new(...)
  class DriverBook < Array
  end

  class StoreBook < Array
  end

  class DriverUtil
    def self.check_driver(driver_book)
      # This method check the current driver book database
      # If there's any driver with rating less than 3.0
      # the method will generate new driver from the driver database

    end

    def self.generate_new_driver(driver_book)
      # this method will generate new driver from
      # the driver database and will append to
      # the driver_book automatically

    end
  end


  class Driver
    # A driver's rating at first instance will always be 0
    attr_accessor :rating
    attr_reader :name
    attr_accessor :coordinate

    # When initialized, the driver and the store object
    # will be stored in the global var
    def initialize(name, coordinate_x, coordinate_y)
      @rating = 0
      @rating_counter = 0
      @name = name
      @coordinate = Coordinate.new(coordinate_x, coordinate_y)
    end

    def self.show_driver(driver_obj)
      puts "Yeay! we found you a driver!"
      puts "Driver name : #{driver_obj.name}"
    end

    def give_rating()
      puts "The order has been finished!! Please give rating to #{@name}"
      # Calculate new rating
      rating_prompt = gets('Rating: ')
      current_rating = @rating
      rating_count = @rating_counter
      new_rating = (rating_count * current_rating + rating_prompt) / (rating_count + 1)
      # Assign new rating to the instance variables
      @rating = new_rating
      @rating_counter += 1
    end

  end


  class Store
    attr_reader :name
    attr_reader :number_of_item
    attr_accessor :coordinate
    attr_reader :menu

    # A store object will have name, coordinate, and number of item(s) in the menu
    def initialize(name, number_of_item, coordinate_x, coordinate_y)
      @name = name
      @number_of_item = number_of_item
      @coordinate = Coordinate.new(coordinate_x, coordinate_y)
    end


    def create_menu
      @menu = Array.new(@number_of_item)
      @menu_counter = 0
    end

    def add_menu(item_name, price)
      @menu[@menu_counter] = Item.new(item_name, price)
      @menu_counter += 1
    end

  end

  class User

    attr_accessor :coordinate
    # A user object only has coordinate when first initiated

    def initialize(coordinate_x, coordinate_y)
      @coordinate = Coordinate.new(coordinate_x, coordinate_y)
    end
  end


end