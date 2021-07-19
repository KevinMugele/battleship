require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'

RSpec.describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_a(Game)
  end

  it 'can create ships' do
    game = Game.new
    game.start
    game.create_ships
    expect(game.player_ships).to eq([player_cruiser, player_submarine])
    expect(game.computer_ships).to eq([computer_cruiser, computer_submarine])
  end
end
