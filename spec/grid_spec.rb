require 'grid'

describe Grid do
  context "initialization" do
    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' } # it's an easy sudoku puzzle, row by row
    let(:solved_puzzle) { '1151131121111119162711684314911121175111413811139151119111811418617125137214611' } # it's an easy sudoku puzzle, row by row
    let(:web_puzzle) { '102004070000902800009003004000240006000107000400068000200800700007501000080400109' }
    let(:grid) { Grid.new(puzzle) }
    let(:cell) { double :cell }
   
    it 'should have 81 cells' do
      expect(grid.cells.length).to eq 81
    end
    
    it 'should have an unsolved first cell' do
      expect(grid.first_cell).to eq 0
    end

    it "makes an array of cells from the puzzle string" do
      expect(grid.cells[28].value).to eq 9
    end

    it "has cells that know what puzzle they are in" do
      expect(grid.cells[73].puzzle.count).to eq 81
    end

    it "can print out what it looks like" do
      expect(grid.inspect).to eq '015003002
000100906
270068430
490002017
501040380
003905000
900081040
860070025
037204600'
    end

    it "knows it is not solved" do
      expect(grid).not_to be_solved
    end

    it "knows it is solved" do
      grid = Grid.new solved_puzzle
      expect(grid).to be_solved
    end

    it "can solve itself" do
      grid.solve
      expect(grid).to be_solved
      puts grid.inspect
    end

    it "can solve an easy sudoku found on the web" do
      grid = Grid.new web_puzzle
      puts grid.inspect
      puts "-----------"
      grid.solve
      expect(grid).to be_solved
      puts grid.inspect
    end

    it "can solve the puzzle" do
      expect(grid.solved?).to be_false
      grid.solve
      expect(grid.solved?).to be_true
      expect(grid.inspect).to eq '615493872
348127956
279568431
496832517
521746389
783915264
952681743
864379125
137254698'
    end

    it "can solve a hard sudoku" do
      # grid = Grid.new '002008050000040070480072000008000031600080005570000600000960048090020000030800900'
      # grid = Grid.new '000079065000003002005060093340050106000000000608020059950010600700600000820390000'
      grid = Grid.new '480006005300090800000003060005762000020000010000581200030600000007010008600200057'
      # grid = Grid.new '000000000000000000000000000000000000000000000000000000000000000000000000000000000'
      # puts grid.inspect
      grid.solve
      puts "SOLUTION"
      puts grid.inspect
      expect(grid).to be_solved
#       expect(grid.inspect).to eq '489126735
# 376495821
# 512873469
# 145762983
# 728934516
# 963581274
# 834657192
# 257319648
# 691248357'
    end

  end
end