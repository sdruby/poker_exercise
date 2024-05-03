class Card
  attr_reader :rank, :suit

  class InvalidCard < StandardError
  end

  RANKS = {
    '0' => 10,
    'j' => 11,
    'q' => 12,
    'k' => 13,
    'a' => 14
  }

  SUITS = ['c', 'd', 'h', 's']

  def initialize(input)
    raise InvalidCard, "#{input} a card is exactly two characters" unless input.is_a?(String) && input.size == 2
    @rank = canonicalize_rank(input[0])
    @suit = input[1].downcase
    raise InvalidCard, "#{@suit} is not in #{SUITS}" unless SUITS.include?(@suit)
    raise InvalidCard, "#{@rank} is not a recogonized rank" unless (2..14).include?(@rank)
  end

  def canonicalize_rank(input)
    RANKS[input.downcase] || input.to_i
  end

  def <=>(other)
    suit == other.suit ? rank <=> other.rank : suit <=> other.suit
  end
end
