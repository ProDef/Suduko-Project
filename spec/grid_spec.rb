require 'grid'

describe Grid do
  context "initialization" do
    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' } # it's an easy sudoku puzzle, row by row
    let(:grid) { Grid.new(puzzle) }
   
    it 'should have 81 cells' do
        expect(grid.cells.length).to eq 81
    end
    
    it 'should have an unsolved first cell' do
        expect(grid.first_cell).to eq 0
    end
    
    it 'should have a solved second cells with value 1' do
        expect(grid.second_cell).to eq 1
    end

    it 'should return an array containing 9 items' do
        expect(grid.cells_array.count).to eq 9
    end

  end
end

# describe Grid do
#   let(:grid) { #init in here }
#   context "solving sudoku" do
#     it "can solve the puzzle" do
#       expect(grid.solved?).to be_false
#       grid.solve
#       expect(grid.solved?).to be_true
#       expect(grid.to_s).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
#     end
#   end
# end