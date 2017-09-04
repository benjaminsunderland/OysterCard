require 'oystercard'

describe OysterCard do
  it 'reads the balance to be 0' do
  oystercard = OysterCard.new(0)
  expect(oystercard.balance).to eq(0)
 end
end
