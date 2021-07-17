require './lib/board'
require './lib/cell'
require './lib/ship'


class Game

  attr_reader :player_board, :computer_board, :player_ships, :computer_ships

  def initialize
    @player_board = nil
    @computer_board = nil
    @player_ships = []
    @computer_ships = []
  end

  def start
    main_menu
    puts "Let's start the game"
    take_turn
  end

  def user_input
    gets.chomp
  end

  def main_menu
    puts "WELCOME TO BATTLESHIP!"
    puts "Enter (p) to play; (q) to quit."

    player_input = user_input.downcase

    while player_input != "p" || player_input != "q"
      if player_input == "p"
        game_setup
      elsif
        player_input == "q"
        exit_game
      else
        puts "Invalid input. Please enter (p) to play; (q) to quit."
        player_input = user_input.downcase
      end
    end
  end

  def game_setup
    create_ships
    computer_board_setup
    player_board_setup
    show_both_boards
  end

  def create_ships
    @player_ships << player_cruiser = Ship.new("Cruiser", 3)
    @player_ships << player_submarine = Ship.new("Submarine", 2)
    @computer_ships << computer_cruiser = Ship.new("Cruiser", 3)
    @computer_ships << computer_submarine = Ship.new("Submarine", 2)
  end

  def computer_board_setup
    @computer_board = Board.new
    # NEED TO MAKE A METHOD TO RANDOMIZE SHIP PLACEMENTS FOR COMPUTER
    puts "I have laid out my ships on the grid."
        puts "==============COMPUTER BOARD=============="
    show_board(computer_board)
  end

  def player_board_setup
    @player_board = Board.new
    puts "Place your ships on the board"
    puts "The cruiser is 3 units long and the submarine is 2 units long."
    puts "==============PLAYER BOARD=============="
    show_board(player_board)
    puts "Enter the cells of where you want to place the cruiser(3 spaces)"
    get_player_ship_coords(player_ships[0])
    place_player_ship(player_ships[0])
    puts "==============PLAYER BOARD=============="
    show_board_with_ships(player_board)
    puts "Enter the cells of where you want to place the submarine(2 spaces)"
    get_player_ship_coords(player_ships[1])
    place_player_ship(player_ships[1])
  end

  def get_player_ship_coords(ship)
    puts "Please format as follows: A1 A2 A3."
    coordinates = user_input.upcase.split
    until @player_board.valid_placement?(ship, coordinates)
      puts "Invalid Placement. Please try again!"
      coordinates = user_input.upcase.split
    end
    coordinates
  end

  def place_player_ship(ship)
    @player_board.place(ship, get_player_ship_coords(ship))
  end

  def show_board(board)
    puts board.render
  end

  def show_board_with_ships(board)
    puts board.render(true)
  end

  def show_both_boards
    puts "=============COMPUTER BOARD============="
    show_board(computer_board)
    puts "=============PLAYER BOARD============="
    show_board_with_ships(player_board)
  end

  def take_turn
    # if (computer_cruiser.sunk? && computer_submarine.sunk?) || (player_cruiser.sunk? && player_submarine.sunk?)
    #   exit_game
    # else


  end

  def exit_game
    puts "Thank you for playing BATTLESHIP."
  end
end
