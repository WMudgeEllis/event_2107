require './lib/food_truck'

RSpec.describe FoodTruck do

  it 'can pass iteration 1' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
    expect(food_truck.check_stock(item1)).to eq(0)

    food_truck.stock(item1, 30)

    expect(food_truck.inventory).to eq({item1 => 30})

    food_truck.stock(item1, 25)

    expect(food_truck.check_stock(item1)).to eq(55)

    food_truck.stock(item2, 12)

    expect(food_truck.inventory).to eq({
      item1 => 55,
      item2 => 12
      })
  end

  it 'can pass iteration 2' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    food_truck.stock(item1, 30)

    expect(food_truck.potential_revenue).to eq(112.50)

    food_truck.stock(item2, 1)

    expect(food_truck.potential_revenue).to eq(115.00)

  end

end
