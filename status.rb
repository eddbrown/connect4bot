module Status
  def check
    @victor = nil
    [
      check_vertical,
      check_horizontal,
      check_diagonal_right,
      check_diagonal_left
    ].any?
  end

  def status
    return (@victor.to_s + 'win').to_sym if check
    return :draw if self.full?
    return :in_play
  end

  def check_vertical
    string_search(@grid)
  end

  def check_horizontal
    string_search(transpose)
  end

  def check_diagonal_right
    string_search(right_diagonals)
  end

  def check_diagonal_left
    string_search(left_diagonals)
  end

  def string_search(array)
    array.any? do |e|
      ['o,o,o,o', 'x,x,x,x'].any? do |str|
        if e.join(',').include?(str)
          @victor = str[0]
        end
        e.join(',').include?(str)
      end
    end
  end

  def right_diagonals
    shifted = each_with_index.map do |col, i|
      padding = []
      (7 - i).times {
        padding << nil
      }
      padding << col
      i.times {
        padding << nil
      }
      padding.flatten
    end.transpose
  end

  def left_diagonals
    shifted = each_with_index.map do |col, i|
      padding = []
      (i).times {
        padding << nil
      }
      padding << col
      (7-i).times {
        padding << nil
      }
      padding.flatten
    end.transpose
  end
end
