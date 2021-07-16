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


  def horizontal_column(coordinates)
    coordinates.all? do |coordinate|
      coordinate[1] == coordinates.first[1]
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


  def render(has_ship = false)
    render_top_line
    # "A . . . . \n" +
    # "B . . . . \n" +
    # "C . . . . \n" +
    # "D . . . . \n"
    get_render_array.each do |x|
      "x"
    end 
    # @cells.map do |coordinate, cell|
    #   cell.render
    # end
  end


  def get_render_array
    rendered_cells = []
    @cells.each do |coordinate, cell|
      rendered_cells << cell
    end
    rendered_cells.map do |cell|
      cell.render
    end
  end


  def render_top_line
    "  1 2 3 4 \n"
  end
end
