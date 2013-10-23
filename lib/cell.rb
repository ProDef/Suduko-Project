class Cell
  
attr_accessor :value, :puzzle

  def initialize(location,value=0)
    @location = location
    @row = row_number
    @column = column_number
    @box = box_number
    @value = value
    @puzzle
  end

  def row_number
    @row = (@location/9) + 1
  end

  
  def column_number
    @column = (@location%9)
  end

  def assign_puzzle puzzle
    @puzzle = puzzle
  end

  def box_number
    ((@column-1)/3) + (((@row-1)/3)*3) + 1
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

  # def neighbours_in_box
  #   box_neighbours = []
  #   box = self.box
  #   (1..81).each do |num|
  #     row = (num/9) + 1
  #     column = (num%9)
  #     if box == ((column-1)/3) + (((row-1)/3)*3) + 1
  #       if self.puzzle[num-1].to_i != 0
  #         if !box_neighbours.include?(self.puzzle[num-1])
  #           box_neighbours << self.puzzle[num-1].to_i
  #         end
  #       end
  #     end
  #   end
  #   box_neighbours
  # end


  def solve
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
  end









end