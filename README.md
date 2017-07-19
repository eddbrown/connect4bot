# connect4bot
A simple AI bot.

The AI takes a two dimensional array representing a connect4 board and returns a column choice (zero-based) of where it would go.

# The Method

The Ai randomly fills the board a specified number of times for strting with each column and scores each column based on that result. It then compares that score with what the opponent would get for placing their piece in the same column on the next go.

# How it performs

This Ai is honestly incredibly difficult to beat. I am very good at this game it beats me roughly a quarter of the time.

# Instructions

``` Terminal
  $ irb
  $ require 'FILE_PATH/game.rb'
  $ game = Game.new
  $ game.start
```
Play against it by typing your column choice (0 through to 6)!
