require 'set'

class Cell
  
attr_accessor :value, :puzzle

  def initialize(location,puzzle_array=[],value=0)
    @location = location
    @row = row_number
    @column = column_number
    @box = box_number
    @value = value
    @puzzle_array = puzzle_array
  end

  def row_number
    @row = @location / 9 
  end

  def column_number
    @column = @location % 9
  end

  def box_number
    (@column / 3) + (@row / 3) * 3 
  end
  
  def filled?
    @value != 0
  end
  
  def box
    @box
  end

  def column
    @column
  end

  def row
    @row
  end

  def candidates
    [1, 2, 3, 4, 5, 6, 7, 8, 9] - self.neighbours.to_a 
  end

  def neighbours
    (self.neighbours_in_box.merge(self.neighbours_in_row)).merge(self.neighbours_in_column)
  end

  def neighbours_in_box
    self.puzzle.select { |cell| cell.box == self.box && cell.value != 0 }.map(&:value).to_set
  end

  def neighbours_in_row
    self.puzzle.select { |cell| cell.row == self.row && cell.value != 0 }.map(&:value).to_set
  end

  def neighbours_in_column
    self.puzzle.select { |cell| cell.column == self.column && cell.value != 0 }.map(&:value).to_set
  end

  def solve
    self.value = self.candidates[0] if self.candidates.count == 1 && !self.solved?
  end

  def solved?
    @value != 0
  end

end