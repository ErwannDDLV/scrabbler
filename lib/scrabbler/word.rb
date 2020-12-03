# frozen_string_literal: true

module Scrabbler
  # represent a word

  require_relative './letter.rb'

  class Word
    def initialize(word)
      @word = word.upcase
    end

    def to_s
      @word
    end

    # @return [Array<Scrabbler::Letter>]
    def letters
      @word.split("").each.with_index.map { |l, i| Letter.new(i, l, self) }
    end

    def length
      @word.length
    end

    def matches(other)
      letters.each.with_object([]).each do |letter, matches|
        matches.push(*letter.matches(other))
      end
    end
  end
end
