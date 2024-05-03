class Rules

  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  def best_hand
    result = [
      :royal_flush,
      :straight_flush,
      :four_of_kind,
      :full_house,
      :flush,
      :straight,
      :three_of_kind,
      :two_pair,
      :pair
    ].detect do |p|
      send("#{p}?")
    end

    result || :high_card
  end

  def four_of_kind?
    rank_tally_values.include?(4)
  end

  def three_of_kind?
    rank_tally_values.include?(3)
  end

  def two_pair?
    rank_tally_values == [2, 2, 1]
  end

  def pair?
    rank_tally_values.include?(2)
  end

  def full_house?
    three_of_kind? && pair?
  end

  def straight?
    # Ace can be 1 or 14 in a straigh?
    (ranks[4] - ranks[0] == 4 && ranks.uniq.size == 5) ||
      ranks == [2, 3, 4, 5, 14]
  end

  def flush?
    suits.uniq.size == 1
  end

  def royal_flush?
    flush? && ranks == [10, 11, 12, 13, 14]
  end

  def straight_flush?
    straight? && flush?
  end

  def suits
    @suits ||= hand.cards.map(&:suit).sort
  end

  def ranks
    @ranks ||= hand.cards.map(&:rank).sort
  end

  def rank_tally
    @rank_tally ||= ranks.tally
  end

  def rank_tally_values
    @rank_tally_values ||= rank_tally.values.sort
  end
end
