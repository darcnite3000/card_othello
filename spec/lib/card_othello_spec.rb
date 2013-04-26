class BoardCell
  def type
  end
end

describe BoardCell do
  it "can return its type" do
    cell = BoardCell.new
    expect(cell.type).to be_nil
  end
end