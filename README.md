Poker hand ranking

Write a function in Ruby that accepts five arguments that represent five cards. Each card will be represented by two characters. The first character is the value of the card: 2-9, 0 (for 10), A, K, Q, and J. The second character is the suit: h, s, d, and c.

The function should return the Poker combination the hand contains. Return values include royal flush, straight flush, four of a kind, full house, flush, straight, three of a kind, two pair, pair, and high card. It should return the highest-ranked combination only.

a binary to start things
rspec specs?

Card
  - can parse the input strings
  - represents which card it is

Hand
  - represents a set of cards
  - contains validations to make sure hands are possible

Rules
  - what are the possible combinations
  - what are the ranking of the combinations
