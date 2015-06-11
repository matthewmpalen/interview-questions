from itertools import combinations, permutations
from math import factorial
from unittest import main, TestCase

SUITS = ('H', 'D', 'C', 'S')
RANKS = ('2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A')

def check_permutations(cards):
    """
    Generator of each permutation of final hands
    """
    result = permutations(cards, 5)
    for r in result:
        yield r

def check_combinations(cards):
    """
    Generator of each combination of final hands
    """
    result = combinations(cards, 5)
    for r in result:
        yield r

def number_of_permutations(cards):
    """
    Mathematical confirmation of total permutations
    """
    card_count = len(cards)
    return factorial(card_count) / (factorial(card_count - 5))

def number_of_combinations(cards):
    """
    Mathematical confirmation of total combinations
    """
    card_count = len(cards)
    return factorial(card_count) / (factorial(5) * factorial(card_count - 5))

def create_deck():
    """
    Factory method of full 52 card deck
    """
    cards = []

    for suit in SUITS:
        for rank in RANKS:
            card_str = '%s-%s' % (rank, suit)
            cards.append(card_str)

    return cards

class FinalHandsTestCase(TestCase):
    def setUp(self):
        self.cards = create_deck()

    def test_permutation_count(self):
        perm_count = sum(1 for _ in check_permutations(self.cards))
        self.assertEqual(perm_count, number_of_permutations(self.cards))

    def test_combination_count(self):
        comb_count = sum(1 for _ in check_combinations(self.cards))
        self.assertEqual(comb_count, number_of_combinations(self.cards))

if __name__ == '__main__':
    main()
