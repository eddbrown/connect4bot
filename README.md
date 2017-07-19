# connect4bot
A simple AI bot.

The AI takes a two dimensional array representing a connect4 board and returns a column choice (zero-based) of where it would go.

# The Method

The AI uses Monte Carlo tree search to choose it next move. For each column, it places its piece in that column and then randomly fills the the board up until the game is over. It scores the column based on how often it won/drew/lost starting with that move.

Initially it did not work very well at all, seemingly scoring each move similarly. However, the key insight was to then score the next players move in that column. So it basically plays itself. It thinks one move ahead and asks how much better off would this future opponent be if I go here. Then it simply scores the column by the difference in the scores!



# How it performs

This Ai is honestly surprisngly difficult to beat. I am very good at this game and it very often results in a draw.

# Instructions

``` Terminal
  $ irb
  $ require '#{INSERT_THE_FILE_PATH}/play.rb'
```
Play against it by typing your column choice (0 through to 6). You get the privilege of going first, it is a generous AI.
