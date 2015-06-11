require 'test/unit'
require 'test/unit/ui/console/testrunner'

SUITS = ['H', 'D', 'C', 'S']
RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']

def factorial(n)
  (1..n).inject(:*) || 1
end

def check_permutations(cards)
  # Enumerator of each permutation of final hands
  cards.permutation(5)
end

def check_combinations(cards)
  # Enumerator of each combination of final hands
  cards.combination(5)
end

def number_of_permutations(cards)
  # Mathematical confirmation of total permutations
  card_count = cards.length
  return factorial(card_count) / (factorial(card_count - 5))
end

def number_of_combinations(cards)
  # Mathematical confirmation of total combinations
  card_count = cards.length
  return factorial(card_count) / (factorial(5) * factorial(card_count - 5))
end

def create_deck()
  # Factory method of full 52 card deck
  cards = []
  
  SUITS.each do |suit|
    RANKS.each do |rank|
      cards << '#{rank}-#{suit}'
    end
  end

  return cards
end

class FinalHandsTestCase < Test::Unit::TestCase
  def setup
    @cards = create_deck()
  end

  def test_permutation_count()
    perm_count = 0
    check_permutations(@cards).each { |hand| perm_count = perm_count + 1 }
    # Fast solution
    #perm_count = check_permutations(@cards).size
    assert_equal(perm_count, number_of_permutations(@cards))
  end

  def test_combination_count()
    comb_count = 0
    check_combinations(@cards).each { |hand| comb_count = comb_count + 1 }
    assert_equal(comb_count, number_of_combinations(@cards))
  end
end

if __FILE__ == $0
  Test::Unit::UI::Console::TestRunner.run(FinalHandsTestCase)
end
