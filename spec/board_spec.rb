require './lib/cell'
require './lib/ship'
require './lib/board'

RSpec.describe Board do
  it "exists" do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it "has cells" do
    board = Board.new

    board.create_cells
    expect(board.cells.keys.length).to eq(16)
  end

end
