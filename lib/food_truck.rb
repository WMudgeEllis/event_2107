class FoodTruck
  attr_reader :inventory, :name

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    product = 0
    @inventory.each do |item, amount|
      product += item.price[1..-1].to_f * amount
    end
    product
  end

end
