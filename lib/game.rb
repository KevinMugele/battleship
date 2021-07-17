require './lib/board'
require './lib/cell'
require './lib/ship'


class Game

  attr_reader :player_board, :computer_board

  def initialize
    @player_board = nil
    @computer_board = nil

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
    computer_board_setup
    player_board_setup
    show_both_boards
  end

  def computer_board_setup
    @computer_board = Board.new
    puts "I have laid out my ships on the grid."
    show_board(computer_board)
  end

  def player_board_setup
    @player_board = Board.new
    puts "Place your ships on the board"
    puts "The cruiser is 3 units long and the submarine is 2 units long."
    show_board(player_board)
    puts "Enter the cells of where you want to place the cruiser(3 spaces)"
    show_board_with_ships(player_board)
    # take input for the cruiser
    puts "Enter the cells of where you want to place the submarine(2 spaces)"
    # take input for the submarine
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

  def exit_game
    puts "Thank you for playing BATTLESHIP."
  end
end
