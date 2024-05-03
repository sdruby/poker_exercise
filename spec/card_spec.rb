require 'spec_helper'

RSpec.describe 'Card' do
  it 'exists' do
    expect(Card).to be
  end

  it 'takes a two character string as input' do
    expect(Card.new('0s')).to be
  end

  ['blablabla', '..', '', 'j', nil, '10h', 'ss', '99', '1h', 1].each do |input|
    it "raises on the invalid input #{input}" do
      expect{ Card.new(input) }.to raise_error(Card::InvalidCard)
    end

  end

end
