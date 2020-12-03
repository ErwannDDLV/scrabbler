module Scrabbler
  require_relative 'match'

  class Letter
    attr_reader :character, :position, :word

    def initialize(position, character, word)
      @position  = position
      @character = character
      @word = word
    end

    def matches(other_word)
      other_word
        .letters
        .select { |ol| ol.eql?(self) }
        .map { |ol| Match.new(self, ol) }
    end

    # @return [TrueClass, FalseClass]
    def eql?(other)
      other.character == self.character
    end

    def to_s
      "#{character}[#{position}]"
    end
  end
end