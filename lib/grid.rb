class Grid


  attr_reader :cells
 
  def initialize(puzzle)
    @cells = puzzle_to_array(puzzle)
  end

  def solve
    outstanding_before, looping = SIZE, false
    while !solved? && !looping
      try_to_solve # ask each cell to solve itself
      outstanding         = @cells.count {|c| c.solved? }
      looping             = outstanding_before == outstanding       
      outstanding_before  = outstanding     
    end 
  end

  def solved?
    # a grid if solved if all cells are filled out. Use .all? method
    # @cells.all? { |cell| cell.solved? }
  end

  def inspect
    # iterate over all cells and print the grid
  end
  def first_cell
    @cells[0]
  end

  def second_cell
    @cells[1]
  end

  def puzzle_to_array puzzle
    puzzle.scan(/.{1}/).map(&:to_i)
  end

end