require "./lib/cell"

class Board

  attr_reader :cells

  def initialize
    @cells = {}

  end

  def create_cells
    letters = ("A".."D").to_a.each do |letter|
      numbers = ("1".."4").to_a.each do |number|
        @cells["#{letters}#{numbers}"] = Cell.new()
      end
    end
  end

end
