require_relative 'peta'

module GoEat
  # Defining constant
  UNIT_COST = 2500

  class Create_Order
    # This class is created to run Order command

    # The main method
    def self.run_order(store_book, driver_book, history_book, user_obj, order_receipt)
      # takes 4 argument:
      # 1. store_book : array of existing store object(s)
      # 2. driver_book : array of existing driver object(s)
      # will be used to determine which driver who will take the order
      # 3. history_book : array of existing order object(s)
      # 4. user_obj the current user object
      # 5. order_receipt object of Order class to save order information

      puts "Welcome to the ordering menu, Kamerad!!"
      puts "Choose from one of this store's number to start ordering!!!"
      # Displaying available store(s)
      store_book.each_with_index {|val, index| puts "#{index + 1}. #{val.name}"}
      # Prompting for store selection
      store_index = gets("Select the store number: ")
      store_obj = store_book[store_index - 1]
      # Selecting driver from driver_book array to determine which
      # driver get the order
      driver_obj = GoEat::Position.select_driver(driver_book, store_obj) # not implemented yet
      # Display driver info
      GoEat::Driver.show_driver(driver_obj)
      # Initializing taking_order method with an array of placed order
      # as the output
      # init empty array as holder
      order_result = Array.new(store_obj.menu.length)
      # Run the take order method with existing arg
      taking_order(store_obj, order_result)
      # Method already puts the final order
      # Displaying price
      # Price = sum of item(s) + delivery fee
      item_price = Pricing.item_pricing(store_obj, order_result)
      delivery_price = Pricing.delivery_pricing(store_obj, user_obj)
      total_price = item_price + delivery_price
      Pricing.display_price(item_price, delivery_price)
      # Next is displaying the route
      puts "Displaying route: "
      GoEat::Travel.driver_route(user_obj, driver_obj, store_obj)
      # Next give rating to the driver
      driver_obj.give_rating()
      # After that we do check to see if any driver
      # has rating < 0
      GoEat::DriverUtil.check_driver(driver_book)
      # After finishing the order prompt
      # this method will write data to a(n) order object and
      # automatically append to the current history_book provided
      # as argument
      order_receipt.driver_name = driver_obj.name
      order_receipt.route = GoEat::DataWriting.write_route(user_obj, driver_obj, store_obj)
      order_receipt.store_name = store_obj.name
      order_receipt.item_ordered = GoEat::DataWriting.write_order(store_obj, order_result)
      order_receipt.price = total_price
      # Add the order_receipt object to the current history_book
      history_book << order_receipt
      # Finished
    end

    def self.taking_order(store_obj, order_result)
      # The size of the order_result array is equivalent to
      # store_obj.item length

      # Prompting order taking sequence with while
      puts "The available menu for #{store_obj.name} Store: "
      puts "0: Done taking order"
      input_num = gets('Select the menu number: ')
      input_quant = gets('How many do you want: ')
      order_result[input_num - 1] += input_quant
      # begin while sequence
      while input_num != 0
        puts "The available menu for #{store_obj.name} Store: "
        puts "0: Done taking order"
        input_num = gets('Select the menu number: ')
        input_quant = gets('How many do you want: ')
        order_result[input_num - 1] += input_quant
      end
      # Reviewing order
      puts "That's all the order folks!!. Here are the orders:"
      order_result.each_with_index {|val, index| puts "#{index + 1}. #{store_obj.item[index].name}: #{val} item(s)"}
      order_prompt = gets('Do you want to order again? (Yes/No): ')
      while order_prompt != "No"
        puts "The available menu for #{store_obj.name} Store: "
        puts "Select the menu you want. To End the order please enter 'No'"
        order_prompt = gets('Select the menu number: ')
        if order_prompt != 'No'
          input_quant = gets('How many do you want: ')
        end
        order_result[input_num - 1] += input_quant
        #prompt again
        order_prompt = gets('Do you want to order again? (Yes/No): ')
      end
      # Show the result order(s)
      puts "Here are the final orders: "
      order_result.each_with_index {|val, index| puts "#{index + 1}. #{store_obj.item[index].name}: #{val} item(s)"}
    end


  end

  class Pricing
    # This class handles pricing stuff
    def self.item_pricing(store_obj, order_result)
      item_price = 0
      order_result.each_with_index do |val, index|
        item_price += store_obj.item[index].price * val
      end
      return item_price
    end

    def self.delivery_pricing(store_obj, user_obj)
      # The delivery price = Distance*Unit_cost
      dist = GoEat::Travel.distance(store_obj, user_obj)
      price = dist * UNIT_COST
      return price
    end

    def self.display_price(item_price, delivery_price)
      puts "Total item(s) price: #{item_price}"
      puts "Delivery price: #{delivery_price}"
      puts "Total price is #{item_price + delivery_price}"
    end
  end


  class Order
    # this class is expected to
    # create 'Order' object(s) to be stored
    # in history object

    # Order object(s) will contain various information of an order:
    # 1. Driver's name
    # 2. Route (in form of text data)
    # 3. Name of store
    # 4. item(s) ordered
    # 5. Price
    # The latter will be store later in a text file with
    # the write_to_file method

    attr_accessor :driver_name
    attr_accessor :route
    attr_accessor :store_name
    attr_accessor :item_ordered
    attr_accessor :price



      def self.write_to_file(filename)

      end


  end


  class History

    def self.show_history(history_book)
      # Show the entire history_book array with the required attr
      # will show: store name, menus ordered, total cost
      history_book.each_with_index do |val, index|
        puts "Order no.#{index + 1}"
        puts "Store name: #{val.store_name}"
        puts "Menus ordered: "
        puts "#{val.item_ordered}"
        puts "Price: #{val.price}"
        puts ""
      end
    end
  end

  class HistoryBook < Array
    # Create a HistoryBook class to track existing order(s)
  end
end

