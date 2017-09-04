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
  subject.deduct(5)
  expect(subject.balance).to eq(5)
 end

it 'changes to journey state to true when touched in' do
  subject.top_up(10)
  subject.touch_in
  expect(subject.in_journey).to be true
end

it 'changes the journey state to false when touched out' do
  subject.top_up(10)
  subject.touch_in
  subject.touch_out
  expect(subject.in_journey).to be false
 end

it 'will throw an error with an insufficient balance' do
  expect{subject.touch_in}.to raise_error("You have an insufficient balance")
 end
end
