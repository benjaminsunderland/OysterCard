require 'station'

describe Station do
  it 'creates a new zone' do
    subject.zone = "zone one"
    expect(subject.zone).to eq("zone one")
  end

  it 'knows the stations name' do
   subject.name = "kingscross"
   expect(subject.name).to eq("kingscross")
 end
end
