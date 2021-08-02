class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today
  end

  def date
    "#{@date.day}/#{@date.month}/#{@date.year}"
  end


  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    total_inventory = {}

    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        total_inventory[item] = {
        quantity: 0,
        food_trucks: []
        }
      end
    end

    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        total_inventory.each do |item_, inventory|
          if item_ == item
            inventory[:quantity] += amount
          end
        end
      end
    end

    total_inventory.each do |item, inventory|
      inventory[:food_trucks] = food_trucks_that_sell(item)
    end


    total_inventory
  end

  def overstocked_items
    overstock =[]
    total_inventory.each do |item, inventory|
      if inventory[:quantity] > 50 && inventory[:food_trucks].length > 1
        overstock << item
      end
    end
    overstock
  end

  def sorted_item_list
    total_inventory.keys.map do |item, inventory|
      item.name
    end.sort
  end
end
