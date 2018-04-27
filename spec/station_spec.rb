require 'station'
describe Station do
  subject { described_class.new('station', 'zone') }

  it 'has a name variable' do
    expect(subject.name).to eq('station')
  end

  it 'has a zone variable' do
    expect(subject.zone).to eq('zone')
  end
end
