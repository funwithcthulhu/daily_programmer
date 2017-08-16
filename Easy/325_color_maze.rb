example = """O G
B O R O Y
O R B G R
B O G O Y 
Y G B Y G 
R O R B R"""

challenge = """R O Y P O
R R B R R R B P Y G P B B B G P B P P R
B G Y P R P Y Y O R Y P P Y Y R R R P P
B P G R O P Y G R Y Y G P O R Y P B O O
R B B O R P Y O O Y R P B R G R B G P G
R P Y G G G P Y P Y O G B O R Y P B Y O
O R B G B Y B P G R P Y R O G Y G Y R P
B G O O O G B B R O Y Y Y Y P B Y Y G G
P P G B O P Y G B R O G B G R O Y R B R
Y Y P P R B Y B P O O G P Y R P P Y R Y
P O O B B B G O Y G O P B G Y R R Y R B
P P Y R B O O R O R Y B G B G O O P B Y
B B R G Y G P Y G P R R P Y G O O Y R R
O G R Y B P Y O P B R Y B G P G O O B P
R Y G P G G O R Y O O G R G P P Y P B G
P Y P R O O R O Y R P O R Y P Y B B Y R
O Y P G R P R G P O B B R B O B Y Y B P
B Y Y P O Y O Y O R B R G G Y G R G Y G
Y B Y Y G B R R O B O P P O B O R R R P
P O O O P Y G G Y P O G P O B G P R P B
R B B R R R R B B B Y O B G P G G O O Y"""

class Maze 
  attr_reader :maze
  attr_reader :key
  def initialize(input)
    @maze = input.split("\n").map {|str| str.delete(" ")}.map do |str|
      str.split('')
    end
    @key = @maze.shift
    p @key
    p @maze
  end

  def solve
    seq = []
    row = 0
    col = 0
    size = @maze.size - 1
    while row < size
      temp = @maze[row][col]
      temp1 = @maze[row+1][col]
      temp2 = @maze[row][col-1]
      temp3 = @maze[row][col+1]
      if @key.include?(temp)
        p temp2
        if row <= size && (@key.include?(temp1) || @key.include?(temp2) || @key.include?(temp3))
          seq << [row, col] if row >= 0 && col >= 0
          p seq
          p temp2
          if @key.include?(temp1)
            row += 1
          elsif @key.include?(temp2)
            col -= 1 unless col.zero?
          elsif @key.include?(temp3)
            col += 1
          end
        else 
          col += 1
        end
      else
        col += 1 unless @maze[row][col+1] == nil
      end 
    end
    seq << [row, col]
    p seq
  end
end

