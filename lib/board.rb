require "./lib/cell"

class Board

  attr_reader :cells

  def initialize
    @cells = create_cells
  end

  def create_cells
    cells = {}
    ("A".."D").to_a.each do |letter|
      ("1".."4").to_a.each do |number|
        cell_coordinate = letter + number
        cells[cell_coordinate] = Cell.new(cell_coordinate)
      end
    end
    cells
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def not_occupied?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def consecutive?(coordinates)
    vertical_column(coordinates) || horizontal_row(coordinates)
  end

  def vertical_column(coordinates)
    coordinates.all? do |coordinate|
      coordinate[0] == coordinates.first[0]
    end
  end

  def vertical_consecutive(coordinates)
    ship_length = coordinates.length
    (1..4).each_cons(ship_length) do |x|
    end
      #make array of results, check results to coordinates, coordinates need change -
  end

  def horizontal_row(coordinates)
    coordinates.all? do |coordinate|
      coordinate[1] == coordinates.first[1]
    end
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.size && not_occupied?(coordinates) && consecutive?(coordinates)
  end
end
