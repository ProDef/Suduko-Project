class Grid


  attr_reader :cells
 
  def initialize(puzzle)
    @cells = puzzle_to_array(puzzle)
  end

  def solve
  end

  def solved?
    # a grid if solved if all cells are filled out. Use .all? method
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

  # def cells_array
  #   @cells.scan(/.{9}/)
  # end







end