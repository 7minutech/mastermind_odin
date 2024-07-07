# creats a peg row
module CreatePegRow
  def create_peg_row(player)
    peg_row = guess(player).each_with_index.map do |color, index|
      if code[index] == color
        "b"
      elsif code.include?(color)
        "w"
      else
        " "
      end
    end
    peg_row.shuffle!
  end
end
