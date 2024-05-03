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

  def initialize(input)
    raise InvalidCard, "a card is exactly two characters" unless input.size == 2
    @rank = canonicalize_rank(input[0])
    @suit = input[1].downcase
  end

  def canonicalize_rank(input)
    RANKS[input.downcase] || input.to_i
  end
end
