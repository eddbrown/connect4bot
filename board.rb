require_relative 'status.rb'
class Board
  include Enumerable
  include Status

  def initialize
    @piece = :x
    @grid = []
    (0..6).each do |col|
      @grid[col] = [nil, nil, nil , nil, nil, nil]
    end
  end

  def piece
    @piece
  end

  def piece=(arg)
    @piece = arg
  end

  def [](col)
    @grid[col]
  end

  def each(&block)
    @grid.each(&block)
    self
  end

  def join
    @grid.join
  end

  def transpose
    @grid.transpose
  end

  def flatten
    @grid.flatten
  end

  def set(arg)
    @grid = arg.map(&:dup)
  end

  def place(column)
    return false if !(0..6).include?(column)
    return false if self[column].compact.size == 6
    i = self[column].find_index(&:nil?)
    self[column][i] = @piece
    alternate_piece
    return true
  end

  def full?
    @grid.flatten.compact.size == 42
  end

  def alternate_piece
    if @piece == :x
      @piece = :o
    else
      @piece = :x
    end
  end

  def reset
    initialize
  end
end
