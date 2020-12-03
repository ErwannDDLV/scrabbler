def print(w1="SCRABBLE", w2="INTERSECTION", w3="POSITIONS", w4="EXERCISE")
  solver = Scrabbler::Solver.new(
    [
      Scrabbler::Word.new(w1),
      Scrabbler::Word.new(w2),
      Scrabbler::Word.new(w3),
      Scrabbler::Word.new(w4),
    ]
  )
  solver.solve.each { |r| Scrabbler::Printer.new(*r).print }
  nil
end
