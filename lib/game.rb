require './lib/board'
require './lib/cell'
require './lib/ship'


class Game

  attr_reader :player_board, :player_ships, :computer_board, :computer_ships

  def initialize
    @player_board = nil
    @computer_board = nil
    @player_ships = []
    @computer_ships = []
  end

  def start
    main_menu
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
      end
    end
  end

  def game_setup
    computer_board_setup(board)
    puts "Place your ships on the board"
    show_board_with_ships
    puts "Enter the cells for the submarine(2 spaces)"
    show_board_with_ships
  end

  def computer_board_setup(board)
    #make board for computer
    puts "I have laid out my ships on the grid."
  end

  def place_ships
    puts "The cruiser is 3 units long and the submarine is 2 units long."
    show_board(board)
    puts "Enter the cells of where you want to place the cruiser(3 spaces)"

  end

  def show_board(board)
    puts board.render
  end

  def show_board_with_ships(board)
    puts board.render(true)
  end

  def exit_game
    puts "Thank you for playing BATTLESHIP."
  end
end
