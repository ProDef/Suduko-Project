class Cell
  
attr_accessor :value # short for def value=(v); @value=v; end

  def initialize
    @value = nil
  end
  
  def filled_out?
  end

  def candidates
  end

  def initialize(neighbours)
    @neighbours = neighbours # array of cells
  end

  def solve
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
  end







end