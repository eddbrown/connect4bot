require_relative 'board.rb'
class Ai
  attr_accessor :difficulty, :test_board
  attr_reader :piece_to_analyze, :piece_to_beat, :actual_board,
    :starting_size, :iteration

  def initialize(actual_board: Board.new, piece_to_analyze: :x, iteration: 100)
    @actual_board = actual_board
    @starting_size = actual_board.flatten.compact.size
    @test_board = Board.new
    @piece_to_analyze = piece_to_analyze
    @piece_to_beat = piece_to_analyze == :x ? :o : :x
    @iteration = iteration
  end


  def choose
    (0..6).max_by { |col| score_column(piece_to_analyze, col) }
  end

  def score_column(piece, column)
    first_score = 0
    second_score = 0
    return -100000 if actual_board[column].compact.size == 6
    #score the option for the AI
    iteration.times {
      reset_test_board
      # place the ai piece in the chosen column and then fill up board
      test_board.place(column)
      if test_board.status != :in_play
        return 100000
      end
      fill_board

      if ai_victory?
        first_score += victory_reward
      elsif opponent_victory?
        first_score += defeat_punishment
      end
    }

    # place the opponent piece in the chosen column and then fill up board
    # and then score it
    iteration.times {
      reset_test_board
      test_board.place(column)
      test_board.place(column)
      fill_board

      if opponent_victory?
        second_score += victory_reward
      elsif ai_victory?
        second_score += defeat_punishment
      end
    }

    # the score of that column is computed by the difference in the ai piece
    # and the score if the opponent is to go in the space above that next
    first_score - second_score
  end

  def fill_board
    until test_board.status != :in_play
      test_board.place((0..6).to_a.shuffle.first)
    end
  end

  def victory_reward
    (100.to_f/(test_board.flatten.compact.size - starting_size).to_f)
  end

  def defeat_punishment
    -(200.to_f/(test_board.flatten.compact.size - starting_size).to_f)
  end

  def ai_victory?
    test_board.status == (piece_to_analyze.to_s + :win.to_s).to_sym
  end

  def opponent_victory?
    test_board.status == (piece_to_beat.to_s + :win.to_s).to_sym
  end

  def reset_test_board
    test_board.set(actual_board)
    test_board.piece = piece_to_analyze
  end
end
