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
    @row = (@location/9) 
  end

  def column_number
    @column = (@location%9)
  end

  def box_number
    ((@column)/3) + (((@row)/3)*3) 
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
  end

  def neighbours_in_box
    box_neighbours = []
    box = self.box
    self.puzzle.each_with_index do |cell, index|
      box_neighbours << cell.value if cell.box == box && cell.value != 0
    end
    box_neighbours
  end


  def solve
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
  end









end