class Grid

  attr_accessor :cells
 
  def initialize(puzzle)
    @cells = puzzle_to_cells(puzzle)
  end

  def first_cell
    @cells[0].value
  end

  def value_array puzzle
    puzzle.scan(/.{1}/).map(&:to_i)
  end

  def puzzle_to_cells puzzle
    cells = []
    value_array(puzzle).each_with_index do |value, index|
      cells << Cell.new(index,[],value)
    end
    cells.each { |cell| cell.puzzle = cells }
  end

  def solve
    replicated_grid = replicate self
    replicated_grid.solve_copy
    @cells = replicated_grid.cells if replicated_grid.solved?
  end

  def solve_copy
    outstanding_before, looping = @cells.count {|c| c.solved? }, false
    # puts "I'm doing an easy solve"
    # puts "Solve before while loop:\n#{self.inspect}"
    while !solved? && !looping
      try_to_solve self
      outstanding         = @cells.count {|c| c.solved? }
      looping             = outstanding_before == outstanding       
      outstanding_before  = outstanding     
    end 
    # puts "Solve after while loop:\n#{self.inspect}"
    start_guessing unless solved?
end

  def start_guessing
    blank_cell = cells.reject { |cell| cell.solved? }.first
    blank_cell.candidates.each do |candidate| 
      # puts "#{blank_cell.candidates}"
      # puts "#{blank_cell.neighbours.to_a}"
      # puts "#{blank_cell.neighbours_in_box.to_a}"
      # puts "#{blank_cell.neighbours_in_row.to_a}"
      # puts "#{blank_cell.neighbours_in_column.to_a}"
      # puts "New candidate for #{blank_cell} at location #{blank_cell.location}"
      # puts "Candidate is #{candidate}"
      blank_cell.value = candidate
      solve if !solved?
    end
  end

  def replicate grid
    replicated_grid = Grid.new ''
    grid.cells.each do |cell| 
      cell_copy = Cell.new cell.location, cell.puzzle, cell.value
      replicated_grid.cells << cell_copy
    end
    replicated_grid.cells.each do |cell|
      cell.puzzle = replicated_grid.cells
    end
    replicated_grid
  end

  def try_to_solve grid
    grid.cells.each { |cell| cell.solve }
  end

  def solved?
    @cells.all? { |cell| cell.solved? }
  end

  def inspect
    grid_string = ''
    (0..80).each do |num| 
      grid_string << @cells[num].value.to_s
      grid_string << "\n" if num % 9 == 8 && num != 80
    end
    grid_string
  end 

  def print_row row_number
    row_string = "Row #{row_number} contains: "
    @cells.each do |cell|
      row_string << "#{cell.value}," if cell.row == row_number
    end
    row_string
  end
end