require './lib/item'
require './lib/food_truck'

class Event

  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
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
    items_for_sale = []
    @food_trucks.map do |food_truck|
      items_for_sale << food_truck if food_truck.inventory.include?(item)
    end
    items_for_sale
  end

end
