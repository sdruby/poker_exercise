class Hand

  attr_writer :cards

  def initialize(*args)
    args.each do |a|
      cards << Card.new(a)
    end
  end

  def cards
    @cards ||= []
  end
end
