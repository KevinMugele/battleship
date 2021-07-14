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

  it "has a valid coordinate" do
    board = Board.new
    board.create_cells

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end
end
