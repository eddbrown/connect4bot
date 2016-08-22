require_relative 'spec_helper'

describe Status do
  let(:board) { Board.new }
  it 'recognises no victory' do
    board.set([
      [:x, :x, nil, nil, nil, nil],
      [:o, :x, nil, nil, nil, nil],
      [:o, :o, :o, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil]
    ])

    expect(board.check).to eq(false)
  end

  it 'recognises vertical victory' do
    board.set([
      [:x, :x, nil, nil, nil, nil],
      [:o, :x, nil, nil, nil, nil],
      [:o, :o, :o, :o, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil]
    ])

    expect(board.check).to eq(true)
  end

  it 'recognises horizontal victory' do
    board.set([
      [:o, :x, nil, nil, nil, nil],
      [:o, :x, nil, nil, nil, nil],
      [:o, :x, :x, :o, nil, nil],
      [:o, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil]
    ])
    expect(board.check).to eq(true)
    expect(board.status).to eq(:owin)
  end

  it 'recognises diagonal right victory' do
    board.set([
      [:x, nil, nil, nil, nil, nil],
      [:o, :x, nil, nil, nil, nil],
      [:o, :o, :x, nil, nil, nil],
      [:o, :o, :o, :x, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil]
    ])

    expect(board.check).to eq(true)
    expect(board.status).to eq(:xwin)
  end

  it 'recognises diagonal left victory' do
    board.set([
      [:o, :o, :o, :x, nil, nil],
      [:o, :o, :x, nil, nil, nil],
      [:o, :x, nil, nil, nil, nil],
      [:x, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil]
    ])
    expect(board.status).to eq(:xwin)
    expect(board.check).to eq(true)
  end
end
