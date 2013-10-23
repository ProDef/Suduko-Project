class Grid


  attr_reader :cells
 
  def initialize(puzzle)
    @cells = puzzle
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
    @cells.slice(0).to_i
  end

  def second_cell
    @cells.slice(1).to_i
  end

  def cells_array
    @cells.scan(/.{9}/)
  end







end