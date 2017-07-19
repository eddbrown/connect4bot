require_relative 'ai.rb'
class Game
  def initialize(human_first_go: true)
     @human_first_go = human_first_go
     @board = Board.new()
   end

   def start
     @board.display
     if @human_first_go
       @human_piece = :x
       @ai_piece = :o
       human_go
     else
       @human_piece = :o
       @ai_piece = :x
       ai_go
     end
   end

   def human_go
     puts 'HUMAN pick a column'
     human_choice = gets
     @board.place(human_choice.to_i)
     @board.display
     if @board.status == (@human_piece.to_s + :win.to_s).to_sym
       puts 'HUMAN WINS'
       return
     end
     draw?
     ai_go
   end

   def ai_go
     ai = Ai.new(actual_board: @board, piece_to_analyze: @ai_piece)
     puts 'AI is thinking ..........'
     choice = ai.choose

     @board.place(choice)
     @board.display
     if @board.status == (@ai_piece.to_s + :win.to_s).to_sym
       puts 'AI HAS BEATEN THE PUNY HUMAN'
       return
     end
     draw?
     human_go
   end

   def draw?
     if @board.status == :draw
       puts "IT'S A DRAW"
       return
     end
   end
 end
