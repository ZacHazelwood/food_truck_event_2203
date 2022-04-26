require './lib/item'

class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      return 0
    else
      @inventory[item]
    end  
  end

  def stock(item, amount)
    @inventory[item] = amount
  end

end
