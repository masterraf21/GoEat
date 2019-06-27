module GoEat

  class Randomize
    def self.random_coordinate(obj, a, b)
      # obj is an object that has coordinate attribute. a and b is the interval
      obj.coordinate.x = rand(a..b)
      obj.coordinate.y = rand(a..b)
    end

  end


  class Travel
    def self.distance(loc_a, loc_b)
      # loc_a and loc_b is object that has coordinate attr
      # this method works as a distance counter and will return distance from point a to point b
      # the counting wil use the basic formula of distance of two points
      # by using the Integer.sqrt method that floor the value to greater-less
      dist_x = (loc_a.coordinate.x - loc_b.coordinate.x)
      dist_y = (loc_a.coordinate.y - loc_b.coordinate.y)
      dist = dist_x ** 2 + dist_y ** 2
      return Integer.sqrt(dist)
    end

    def self.driver_route(user, driver, store)
      # This method will generate driver's route
      # from driver -> store -> user
      # complete with its steps

    end

    def self.route(loc_a, loc_b)
      # this method will generate step by step route
      # completing the travel_to method


    end

    def self.travel_to(loc_a, loc_b)
      # this method will generate

    end
  end

  class Position
    # This class handle positioning guide
    # such as selecting driver nearest a store

    def self.select_driver(driver_book, store)
      # This method is expected to return a driver object
      # after selecting the nearest one with the store


    end


  end
  class Maps

    attr_accessor :map_array

    # initialize the map with specified width and height
    def initialize(width, height)
      @width = width
      @height = height
    end

    def generate_map
      # Map will be generated with default value 0 for every region
      @map_array = Array.new(@width) {Array.new(@height, 0)}
    end

    def add_to_map(obj)
      # add specified value to map according to the type of the object
      # method will add values
      # 0 : default. 1 : User, 2 : Driver, 3 : Store
      if (obj.class == User)
        @map_array[obj.coordinate.x][obj.coordinate.y] = 1
      elsif (obj.class == Driver)
        @map_array[obj.coordinate.x][obj.coordinate.y] = 2
      else #obj.class == Store
        @map_array[obj.coordinate.x][obj.coordinate.y] = 3
      end
    end

    def add_book_to_map(object_book)
      # This method will ad an array consist of objects
      # to the current map initialized
      object_book.each_with_index do |val, _index|
        if (val.class == User)
          @map_array[val.coordinate.x][val.coordinate.y] = 1
        elsif (val.class == Driver)
          @map_array[val.coordinate.x][val.coordinate.y] = 2
        else #obj.class == Store
          @map_array[val.coordinate.x][val.coordinate.y] = 3
        end

      end

    end

    def draw_map
      puts "HELLO BITCHES"

    end

    private

    attr_reader :width
    attr_reader :height
  end


end