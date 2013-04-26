require 'board_cell'

# class Board
# end
# 
# describe Board do
#   xit 'is a matrix of board_cells' do
#   end
# end
class Game
  attr_reader :board
  def initialize(board: nil)
    @board = board
  end
end

describe Game do
  it "sets up board" do
    board = double('board')
    game = Game.new board: board
    expect(game.board).to eq board
  end
end