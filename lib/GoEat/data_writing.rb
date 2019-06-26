module GoEat

  class DataWriting
    def self.write_order(store_obj, order_result)
      output = ""
      order_result.each_with_index do |val, index|
        output += "#{index + 1}. #{store_obj.item[index].name}: #{val} item(s). "
      end
      return output
    end

    def self.write_route(user, driver, store)


    end


  end
end

