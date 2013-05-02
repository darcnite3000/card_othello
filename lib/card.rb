class Card
  attr_reader :sides, :type, :name
  def initialize(name: nil, type: nil, sides: {north: 1, south: 1, east: 1, west: 1})
    @sides = sides
    @type = type
    @name = name
  end
end