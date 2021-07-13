require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it "exists" do
    cell = Cell.new("B4")
    expect(cell).to be_a(Cell)
  end

  xit "has a coordinate" do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end

  xit "has a ship" do
    cell = Cell.new("B4")
    expect(cell.ship).to eq(nil)
  end

  xit "checks if cell is empty" do
    cell = Cell.new("B4")
    expect(cell.empty?) to be true
  end

  xit "placing a ship" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to be false
  end
end
