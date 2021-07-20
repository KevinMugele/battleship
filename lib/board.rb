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
    (vertical_row(coordinates) || horizontal_column(coordinates)) && (horizontal_consecutive(coordinates) || vertical_consecutive(coordinates))
  end

  def vertical_row(coordinates)
    coordinates.all? do |coordinate|
      coordinate[0] == coordinates.first[0]
    end
  end

  def horizontal_column(coordinates)
    coordinates.all? do |coordinate|
      coordinate[1] == coordinates.first[1]
    end
  end

  def horizontal_consecutive(coordinates)
    ship_length = coordinates.length
    coordinate_values = []
      coordinates.each do |coordinate|
        coordinate_values << coordinate[1]
      end

    ("1".."4").each_cons(ship_length).find do |x|
      x == coordinate_values
    end
  end

  def vertical_consecutive(coordinates)
    ship_length = coordinates.length
    coordinate_values = []
      coordinates.each do |coordinate|
        coordinate_values << coordinate[0]
      end

    ("A".."D").each_cons(ship_length).find do |x|
      x == coordinate_values
    end
  end

  def valid_placement?(ship, coordinates)
    if (consecutive?(coordinates) && ship.length == coordinates.size && not_occupied?(coordinates))
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    if (valid_placement?(ship, coordinates))
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(reveal = false)
    rendered_board_no_ships =
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"

    rendered_board_with_ships =
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
    "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
    "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
    "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"

    if reveal == true
      rendered_board_with_ships
    else
      rendered_board_no_ships
    end
  end
end

# Working on getting board.render to be iterated rather than hard coded.
#   def render(has_ship = false)
#     render_top_line
#     get_render_array.each do |x|
#       "x"
#     end
#   end
#
#   def get_render_array
#     rendered_cells = []
#     @cells.each do |coordinate, cell|
#       rendered_cells << cell
#     end
#     rendered_cells.map do |cell|
#       cell.render
#     end
#   end
#
#   def render_top_line
#     "  1 2 3 4 \n"
#   end
# end
