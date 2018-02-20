require "pry"

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)

  WIN_COMBINATIONS.each do |combo|
    return combo if combo.all? {|index| board[index] == "X"}
    return combo if combo.all? {|index| board[index] == "O"}
  end

  return false if board.all? {|box| box.strip.empty?}
  return false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if won?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if !won?(board) && full?(board)
    return true
  elsif full?(board) && won?(board)
    return true
  elsif won?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
