require 'cell'


describe Cell do 

	let(:cell) {cell = Cell.new}
	let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' } # it's an easy sudoku puzzle, row by row
    let(:grid) { double :grid, cells: puzzle }

	it "tells us if it is empty" do
		cell = Cell.new(23)
		expect(cell.filled?).to be_false
	end

	it "tells us if it is filled" do
		cell = Cell.new(12,7)
		expect(cell.filled?).to be_true
	end

	xit "knows what its neighbours are from its box" do
		expect(grid.cells[1].box_neighbours).to eq [2, 5, 7]
	end

	it " knows what row it is in" do 
		cell = Cell.new(67)		
		expect(cell.row).to eq 8
	end

	it 'knows what column it is in' do
		cell = Cell.new(39)
		expect(cell.column).to eq 3
	end








	# it "has puzzle index value 12" do
	# 	cell = Cell.new
	# 	expect()
	# end











end

# 015003002
# 000100906
# 270068430
# 490002017
# 501040380
# 003905000
# 900081040
# 860070025
# 037204600