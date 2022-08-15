board_array = []

'A'.upto('C') do |x|
  3.times do |y|
    board_array.push([x, y])
  end
end

p board_array
