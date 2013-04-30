require 'game'

describe Game do
  let(:player_1){ double('player') }
  let(:player_2){ double('player') }
  let(:players){ [player_1, player_2] }
  let(:card){ double('card') }
  let(:empty_cell){ double('cell', :empty? => true, :card => nil) }
  let(:full_cell){ double('cell', :empty? => false, :card => card) }
  let(:full_board){ [full_cell] }
  let(:empty_board){ [empty_cell] }
  context '.new' do
    it "has a game board" do
      board = double('board')
      game = Game.new board: board
      expect(game.board).to eq board
    end
    it "has two players" do
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
      game = Game.new players: players
      expect(game.current_player).to eq player_1
    end
  end
  it "allows the players to alternately place a card" do
    game = Game.new players: players
    row = 0
    column = 0
    game.place_card card, row, column
    expect(game.current_player).to eq player_2
  end
  it "is not complete when more cards can be placed" do
    game = Game.new players: players, board: empty_board
    expect(game.complete?).to be_false
  end
  it "is complete when no more cards can be placed" do
    game = Game.new players: players, board: full_board
    expect(game.complete?).to be_true
  end
  it "can tell who the winner is" do
    player_a = 1
    player_b = 9
    game = Game.new players: [player_a,player_b]
    expect(game.winner).to eq player_b
  end
  it "can tell if it's a draw" do
    player_a = 5
    player_b = 5
    game = Game.new players: [player_a,player_b]
    expect(game.winner).to be_false
  end
end
