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
    puts "Let's start the game!"
    take_turns


  end

  def user_input
    gets.chomp
  end

  def main_menu
    puts "WELCOME TO BATTLESHIP!"
    puts "Enter (p) to play; (q) to quit."

    player_input = user_input.downcase

    until player_input == "done"
      if player_input == "p"
        game_setup
        player_input = "done"
      elsif
        player_input == "q"
        exit
        player_input = "done"
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
    place_computer_board(@computer_ships[0])
    place_computer_board(@computer_ships[1])
    puts "I have laid out my ships on the grid."
    puts "==============COMPUTER BOARD=============="
    show_board(computer_board)
  end

  def computer_coord(computer_ship)
    computer_coordinates = @computer_board.cells.keys.sample(computer_ship.length)

    until @computer_board.valid_placement?(computer_ship, computer_coordinates)
      computer_coordinates = @computer_board.cells.keys.sample(computer_ship.length)
    end
    computer_coordinates
  end

  def place_computer_board(ship)

    @computer_board.place(ship, computer_coord(ship))
  end

  def player_board_setup
    @player_board = Board.new
    puts "Place your ships on the board"
    puts "The cruiser is 3 units long and the submarine is 2 units long."
    puts "==============PLAYER BOARD=============="
    show_board(player_board)
    puts "Enter the cells of where you want to place the cruiser(3 spaces)"
    user_coords = get_player_ship_coords(player_ships[0])
    place_player_ship(player_ships[0], user_coords)
    puts "==============PLAYER BOARD=============="
    show_board_with_ships(player_board)
    puts "Enter the cells of where you want to place the submarine(2 spaces)"
    user_coords = get_player_ship_coords(player_ships[1])
    place_player_ship(player_ships[1], user_coords)
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

  def place_player_ship(ship, user_coords)
    @player_board.place(ship, user_coords)
  end

  def show_board(board)
    puts board.render
  end

  def show_board_with_ships(board)
    puts board.render(true)
  end

  def show_both_boards
    puts "=============COMPUTER BOARD============="
    show_board(@computer_board)
    puts "=============PLAYER BOARD============="
    show_board_with_ships(@player_board)
  end

  def take_turns

    until computer_ships_sunk? || player_ships_sunk?
      show_both_boards
      player_take_turn
      computer_take_turn
    end
    game_over
  end

  def player_take_turn
    # gets.chomp a coordinate
    # make sure it has not been fired upon previously
    #
    # else
  end

  def computer_take_turn
    # .sample a random key for the guess
    # make sure it has not already been fired upon
  end

  def computer_ships_sunk?
    win = @computer_ships.all? do |ship|
      ship.sunk?
    end
  win
  end

  def computer_ships_sunk?
    lose = @player_ships.all? do |ship|
      ship.sunk?
    end
  lose
  end

  def game_over
    if player_ships_sunk?
      computer_win
    else
      player_win
    end
    remove_ships
    main_menu
  end 

  def remove_ships
    computer_ships = []
    player_ships = []
  end

  def player_win
    puts "Congratulations! You won!"
    puts "Heading back to main menu"
    main_menu
  end

  def computer_win
    puts "I'm sorry, but you are a loser!"
    puts "Heading back to main menu"
    main_menu
  end

  def exit_game
    puts "Thank you for playing BATTLESHIP."
  end
end
