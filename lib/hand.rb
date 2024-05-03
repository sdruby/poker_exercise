class Hand

  attr_writer :cards

  class InvalidHand < StandardError
  end

  def initialize(*args)
    args.each do |a|
      cards << Card.new(a)
    end

    raise InvalidHand, 'There should be 5 cards' unless cards.size == 5
    raise InvalidHand, 'Only using a standard 52 card deck' unless cards.uniq.size == 5
  end

  def cards
    @cards ||= []
  end
end
