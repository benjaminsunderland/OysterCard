require 'oystercard'

describe OysterCard do
 it 'reads the balance to be 0' do
  expect(subject.balance).to eq(0)
 end

 it 'can top up the oystercard' do
  subject.top_up(5)
  expect(subject.balance).to eq(5)
 end

 it 'cannot exceed the top_up limit' do
  expect{subject.top_up(100)}.to raise_error("#{OysterCard::MAXIMUM} is over your allowed top-up limit")
 end

it 'should deduct money from the balance' do
  subject.top_up(10)
  subject.send(:deduct, 5)
  expect(subject.balance).to eq(5)
 end

it 'will deduct money from the oystercard when touched out' do
  subject.top_up(5)
  subject.send(:deduct, 5)
  expect{subject.touch_out}.to change{subject.balance}.by(-1)
end

it 'changes to journey state to true when touched in' do
  subject.top_up(10)
  kingscross = double
  subject.touch_in(kingscross)
  expect(subject.in_journey).to be true
end

it 'changes the journey state to false when touched out' do
  subject.top_up(10)
  kingscross = double
  subject.touch_in(kingscross)
  subject.touch_out
  expect(subject.in_journey).to be false
 end

it 'will throw an error with an insufficient balance' do
  kingscross = double
  expect{subject.touch_in(kingscross)}.to raise_error("You have an insufficient balance")
 end

it 'remembers the entry station when user touches in' do
  subject.top_up(5)
  kingscross = double
  subject.touch_in(kingscross)
  expect(subject.station_name).to eq(kingscross)
 end
end
