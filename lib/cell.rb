class Cell

  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

  def fire_upon
    if @ship != nil
      ship.hit
    end
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end

  def render(has_ship = false)
    if has_ship == true && @ship != nil && @fired_upon == false
      "S"
    elsif
      @fired_upon == false
      "."
    elsif
      @fired_upon == true && @ship == nil
      "M"
    elsif
      @fired_upon == true && @ship.sunk?
      "X"
    else
      @fired_upon == true && @ship != nil
      "H"
    end
  end
end
