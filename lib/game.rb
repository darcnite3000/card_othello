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
  def place_card card, row, column
    @player_enumerator.next
  end
  def complete?
    @board.each.none? {|cell| cell.empty? }
  end
  def winner
    if @players[0] > @players[1]
      @players[0]
    elsif @players[1] > @players[0]
      @players[1]
    end
  end
end