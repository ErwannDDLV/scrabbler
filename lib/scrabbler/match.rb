# frozen_string_literal: true

module Scrabbler
  class Match
    attr_reader :letter1, :letter2

    def initialize(letter1, letter2)
      @letter1 = letter1
      @letter2 = letter2
    end

    def letter_from(word)
      return @letter1 if @letter1.word == word
      return @letter2 if @letter2.word == word

      nil
    end

    def word1
      @letter1.word
    end

    def word2
      @letter2.word
    end

    def common_word(other_match)
      other_match.letter_from(word1)&.word || other_match.letter_from(word2)&.word
    end

    def distance_from(other_match)
      if (other_letter = other_match.letter_from(word1))
        return @letter1.position - other_letter.position
      end
      if (other_letter = other_match.letter_from(word2))
        return @letter2.position - other_letter.position
      end
      nil
    end

    def to_s
      "#{letter1.character}[#{word1}[#{letter1.position}] - #{word2}[#{letter2.position}]]"
    end
  end
end