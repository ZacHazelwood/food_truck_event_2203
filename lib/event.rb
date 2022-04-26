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

  def sorted_item_list
    items = @food_trucks.map do |food_truck|
      food_truck.inventory.keys
    end.flatten.uniq
    items.sort_by { |item| item.name}
  end

  def overstocked_items
    total_items = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if total_items[item] == nil
          total_items[item] = { quantity: quantity, food_trucks: [food_truck] }
        else
          total_items[item][:quantity] += quantity
          total_items[item][:food_trucks] << food_truck
        end
      end
    end
    total_items.select do |_item, data|
      data[:quantity] > 50 && data[:food_trucks].length > 1
    end.keys
  end

  def total_inventory
    total_items = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if total_items[item] == nil
          total_items[item] = { quantity: quantity, food_trucks: [food_truck] }
        else
          total_items[item][:quantity] += quantity
          total_items[item][:food_trucks] << food_truck
        end
      end
    end
    total_items
  end
end
