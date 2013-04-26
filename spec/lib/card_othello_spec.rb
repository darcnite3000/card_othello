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

describe BoardCell do
  let(:card){ double('card') }
  
  it "can return its type" do
    type = double('type')
    cell = BoardCell.new type: type
    expect(cell.type).to eq type
  end
  
  it "can store a card" do
    cell = BoardCell.new card: card
    expect(cell.card).to eq card
  end
  
  context "a cell without a card" do
    let(:cell){ BoardCell.new }
    it "can add a card to itself" do
      expect{ cell.card = card }.to_not raise_error
      expect(cell.card).to eq card
    end
    it 'is empty?' do
      expect(cell.empty?).to be_true
    end
  end
  
  context "a cell with a card" do
    let(:cell){ BoardCell.new card: card }
    it "cannot add a card to itself" do
      new_card = double('new_card')
      expect{ cell.card = new_card }.to raise_error BoardCell::InvalidPlacement
      expect(cell.card).to eq card
    end
    it 'is not empty?' do
      expect(cell.empty?).to be_false
    end
  end
end