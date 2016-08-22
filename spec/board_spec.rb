require 'spec_helper'

describe Board do
  let(:board) { Board.new }
  it 'can place a piece' do
    board.place(0)

    expect(board[0][0]).to eq(:x)
  end

  it 'places alternate pieces (defaulting to first player :x)' do
    2.times {
      board.place(0)
    }

    expect(board[0][0]).to eq(:x)
    expect(board[0][1]).to eq(:o)
  end

  context 'full?' do
    it 'returns true if the board is full' do
      expect(board).not_to be_full
      (0..6).each do |col|
        6.times {
          board.place(col)
        }
      end
      expect(board).to be_full
    end
  end

  context '#place' do
    it 'returns true if the column is not full' do
      expect(board.place(0)).to eq(true)
    end

    it 'returns false if the column is full' do
      6.times {
        board.place(0)
      }
      expect(board.place(0)).to eq(false)
    end

    it 'returns true/false if the number is in/out of range' do
      (0..6).each do |col|
         expect(board.place(col)).to eq(true)
      end
      [-1, 7].each do |col|
         expect(board.place(col)).to eq(false)
      end
    end
  end
end
