class Cell
  
attr_accessor :value # short for def value=(v); @value=v; end

  def initialize(location,value=0)
    @row = (location/9) + 1
    @column = (location%9)
    @value = value
  end
  
  def filled?
    @value != 0
  end

  def column
    @column
  end

  def row
    @row
  end

  def candidates
  end

  # def initialize(neighbours)
  #   @neighbours = neighbours # array of cells
  # end

  def solve
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
  end









end