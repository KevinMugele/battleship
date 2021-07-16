require './lib/board'
require './lib/cell'
require './lib/ship'


class Game
  def initialize

  end

  def start
    main_menu
  end

  def main_menu
    puts "WELCOME TO BATTLESHIP!"
    puts "Enter (p) to play; (q) to quit."
    player_input = gets.chomp.downcase
    if player_input == "p"
      play_game
    elsif
      player_input == "q"
      exit_game
    else
      puts "Enter (p) to play; (q) to quit."
    end
  end

  def play_game
    puts "I have laid out my ships on the grid."
    puts "Place your ships on the board"
    # need to make computer to place ships on board randomly.
    #maybe .sample method works?
    puts "The cruiser is 3 units long and the submarine is 2 units long."
    show_board(board)
    puts "Enter the cells of where you want to place the cruiser(3 spaces)"
    #get user input for their spaces
    show_board_with_ships
    puts "Enter the cells for the submarine(2 spaces)"
    #get user input for their spaces
    #need to prompt user if invalid coordinates
    show_board_with_ships
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
