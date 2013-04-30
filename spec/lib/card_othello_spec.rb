require 'board_cell'
require 'Matrix'

class Game
  attr_reader :board, :players, :rules
  def initialize(board: nil, players: [nil, nil], rules: nil)
    @board = board
    @players = players
    @rules = rules
    @player_enumerator = @players.cycle
  end
  def current_player
    @player_enumerator.peek
  end
  def place_card
    @player_enumerator.next
  end
end

describe Game do
  context '.new' do
    it "has a game board" do
      board = double('board')
      game = Game.new board: board
      expect(game.board).to eq board
    end
    it "has two players" do
      players = [double('player'), double('player')]
      game = Game.new players: players
      expect(game.players).to eq players
      expect(game.players.length).to eq 2
    end
    it "has a ruleset" do
      rules = double('ruleset')
      game = Game.new rules: rules
      expect(game.rules).to eq rules
    end
    it "sets the current player" do
      player_1 = double('player')
      player_2 = double('player')
      players = [player_1,player_2]
      game = Game.new players: players
      expect(game.current_player).to eq player_1
    end
  end
  it "allows the players to alternately place a card" do
    player_1 = double('player')
    player_2 = double('player')
    players = [player_1,player_2]
    game = Game.new players: players
    game.place_card
    expect(game.current_player).to eq player_2
  end
  xit "is over when no more cards can be placed"
  xit "can tell who the winner is or if it's a draw"
end
