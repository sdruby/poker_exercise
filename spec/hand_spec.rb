require 'spec_helper'

RSpec.describe 'Hand' do
  it 'should exist' do
    expect(Hand).to be
  end

  {
    ['2h', '5d', 'Qs', 'Qd', 'Qc'] => 'three_of_kind',
    ['2h', '5d', 'Ks', 'Qd', 'Qc'] => 'pair',
    ['Kh', 'Jh', 'Qh', 'Ah', '0h'] => 'royal_flush',

  }.each do |cards, result|
    it "#{cards} result in #{result}" do
      expect(Rules.new(Hand.new(*cards)).best_hand).to eq(result.to_sym)
    end
  end
end
