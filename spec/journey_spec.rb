require 'journey'

describe Journey do

  it 'has a fare method' do
  expect(subject).to respond_to(:fare)
 end

  it 'will be default charge the penalty fare by deault' do
  expect(subject.fare).to eq(Journey::PENALTY_FARE)
 end

 it "knows if a journey is not complete" do
   expect(subject).not_to be_complete
 end
end
