# frozen_string_literal: true

module Scrabbler
  class Printer
    #@return [Scrabbler::Match]
    attr_reader :pivot1, :pivot2, :pivot3, :pivot4

    def initialize(pivot1, pivot2, pivot3, pivot4)
      @pivot1 = pivot1
      @pivot2 = pivot2
      @pivot3 = pivot3
      @pivot4 = pivot4
    end

    def word1
      @_word1 ||= pivot1.common_word(pivot4)
    end

    def word2
      @_word2 ||= pivot2.common_word(pivot1)
    end

    def word3
      @_word3 ||= pivot3.common_word(pivot2)
    end

    def word4
      @_word4 ||= pivot4.common_word(pivot3)
    end

    def width
      max_x - min_x + 1
    end

    def height
      max_y - min_y + 1
    end

    def grid
      build_blank_grid
    end

    def coordinates
      @_coordinates ||= Hash.new { " " }.tap do |coord|
        word1.to_s.split("").each.with_index do |letter, i|
          coord[[i, 0]] = letter
        end

        word2_x = pivot1.letter_from(word1).position
        word2_y = -pivot1.letter_from(word2).position
        word2.to_s.split("").each.with_index do |letter, i|
          coord[[word2_x + 0, word2_y + i]] = letter
        end

        word3_x = word2_x - pivot2.letter_from(word3).position
        word3_y = word2_y + pivot2.letter_from(word2).position
        word3.to_s.split("").each.with_index do |letter, i|
          coord[[word3_x + i, word3_y]] = letter
        end

        word4_x = pivot4.letter_from(word1).position
        word4_y = -pivot4.letter_from(word4).position
        word4.to_s.split("").each.with_index do |letter, i|
          coord[[word4_x + 0, word4_y + i]] = letter
        end
      end
    end

    def min_x
      coordinates.keys.map(&:first).min
    end

    def min_y
      coordinates.keys.map(&:last).min
    end

    def max_x
      coordinates.keys.map(&:first).max
    end

    def max_y
      coordinates.keys.map(&:last).max
    end

    def print
      puts (Array.new(width) { "---" }+["--"]).join("")
      puts "|#{Array.new(width) { "   " }.join("")}|"
      (0..height-1).each do |y|
        line = (0..width-1).map do |x|
          coordinates[[x + min_x, y + min_y]]
        end.join("  ")
        puts "| #{line} |"
      end
      puts "|#{Array.new(width) { "   " }.join("")}|"
      puts (Array.new(width) { "---" }+["--"]).join("")
    end

    private

    def build_blank_grid
      Array.new(height) { Array.new(width) { "" } }
    end
  end
end
