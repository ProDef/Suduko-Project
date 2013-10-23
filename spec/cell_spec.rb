require 'cell'


describe Cell do 

	let(:cell) {cell = Cell.new}
	let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' } # it's an easy sudoku puzzle, row by row
    let(:grid) { double :grid, cells: puzzle }

	it "tells us if it is empty" do
		cell = Cell.new(12)
		expect(cell.filled?).to be_false
	end

	it "tells us if it is filled" do
		cell = Cell.new(12,[],7)
		expect(cell.filled?).to be_true
	end

	it "knows what its neighbours are from its box" do
		puzzle_string_array = []
		'015003002000100906270068430490002017501040380003905000900081040860070025037204600'.each_char { |char| puzzle_string_array << char.to_i }
		puzzle_array = []
		puzzle_string_array.each_with_index do |value, index|
			puzzle_array << Cell.new(index,[],value)
		end 
		puzzle_array[41].puzzle = puzzle_array
		cell = puzzle_array[41]
		expect(cell.neighbours_in_box).to eq [2, 4, 9, 5]
	end

	it "knows what row it is in" do 
		cell = Cell.new(67)		
		expect(cell.row).to eq 7
	end

	it 'knows what column it is in' do
		cell = Cell.new(39)
		expect(cell.column).to eq 3
	end

	it "knows what box it is in" do
		cell = Cell.new(39)
		expect(cell.box).to eq 4
	end





end

# 015 003 002
# 000 100 906
# 270 068 430

# 490 002 017
# 501 040 380
# 003 905 000

# 900 081 040
# 860 070 025
# 037 204 600








