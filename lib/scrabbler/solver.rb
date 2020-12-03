# frozen_string_literal: true
require_relative "./word.rb"
require_relative "./printer"

module Scrabbler
  # Solve the problem
  class Solver
    attr_reader :words
    # @param [Array<Scrabbler::Word>] words
    def initialize(words)
      @words = words
    end

    def pivots
      @_pivots ||= Hash.new.tap do |matches|
        @words.combination(2).map do |w1, w2|
          matches[Set.new([w1, w2])] = w1.matches(w2)
        end
      end
    end

    def solve
      [].tap do |results|
        each_words_loops do |words|
          pivots_collections = words.each_cons(2).map { |word1, word2| pivots[Set[word1, word2]] }
          each_paths(pivots_collections) do |p1, p2, p3, p4|
            if valid_solution?(p1, p2, p3, p4)
              results << [p1, p2, p3, p4]
            end
          end
        end
      end
    end

    def each_words_loops
      root_word, *other_words = @words

      # All circular permutations of the other words
      permutations = other_words.each.with_index.map do |_elm, i|
        new_arr = other_words.dup; new_arr.push(*new_arr.shift(i + 1))
      end

      permutations.map do |permutation|
        yield [root_word, *permutation, root_word]
      end
    end

    protected

    def valid_solution?(p1, p2, p3, p4)
      l1 = p2.distance_from(p1)
      l2 = p3.distance_from(p4)
      l3 = p4.distance_from(p1)
      l4 = p3.distance_from(p2)

      # all present
      return false unless l1 && l2 && l3 && l4

      # must be >1 (no adjacent words)
      return false unless l1.abs > 1 && l2.abs > 1 && l3.abs > 1 && l4.abs > 1

      # length constraints
      return false unless l1 == l2 && l3 == l4

      true
    end

    def each_paths(pivots_collections)
      pivots_collections[0].each do |pivot1|
        pivots_collections[1].each do |pivot2|
          pivots_collections[2].each do |pivot3|
            pivots_collections[3].each do |pivot4|
              yield(pivot1, pivot2, pivot3, pivot4)
            end
          end
        end
      end
    end
  end
end
