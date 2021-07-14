require "./lib/cell"

class Board

  attr_reader :cells

  def initialize
    @cells = {}
  end

  def create_cells
    ("A".."D").to_a.each do |letter|
      ("1".."4").to_a.each do |number|
        cell_coordinate = letter + number
        @cells[cell_coordinate] = Cell.new(cell_coordinate)
      end
    end
    @cells
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end
end
