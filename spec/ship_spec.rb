require './lib/ship'

RSpec.describe Ship do
  xit 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_a(Ship)
  end

  xit 'has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
  end

  xit 'has a length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length).to eq(3)
  end

  xit 'has health' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
  end

  xit 'checks if ship is sunk' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to eq(false)
  end

  xit 'checks health after getting hit' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    expect(cruiser.health).to eq(2)

    cruiser.hit
    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
  end
end
