class Card
  attr_reader :sides, :type, :name
  def initialize(name: nil, type: nil, sides: {north: 1, south: 1, east: 1, west: 1})
    @sides = sides
    @type = type
    @name = name
  end
end

describe Card do
  it "can return it's sides" do
    points = {north: 1, south: 2, east: 3, west: 4}
    card = Card.new sides: points
    expect(card.sides).to eq points
  end
  it "can return it's type" do
    type = double('type')
    card = Card.new type: type
    expect(card.type).to eq type
  end
  it "can return it's name" do
    name = "Matz"
    card = Card.new name: name
    expect(card.name).to eq name
  end
end