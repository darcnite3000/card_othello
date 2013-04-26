class BoardCell
  class InvalidPlacement < StandardError; end
  attr_reader :type, :card
  def initialize(type: nil, card: nil)
    @type = type
    @card = card
  end
  
  def empty?
    !!!@card
  end
  
  def card= card
    if @card 
      raise InvalidPlacement
    else
      @card=card
    end
  end
end