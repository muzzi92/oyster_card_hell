require 'oystercard'

describe Oystercard do

  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  it 'has balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up balance by 10' do
    expect { subject.top_up(10) }.to change { subject.balance }.by(10)
  end

  it 'it has a maximum balance' do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
    expect { subject.top_up(1) }.to raise_error "maximim balance of £#{Oystercard::MAXIMUM_BALANCE} exceeded"
  end

  it 'returns true when touch_in called' do
    subject.top_up(Oystercard::MINIMUM_BALANCE)
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it 'returns false when touch_out called' do
    subject.touch_out(exit_station)
    expect(subject).not_to be_in_journey
  end

  it 'is initially not in journey' do
    expect(subject).not_to be_in_journey
  end

  it 'does not let user touch in with 0 balance' do
    expect { subject.touch_in(entry_station) }.to raise_error 'insufficient funds available'
  end

  it 'deducts minimum balance when touch_out is called' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
  end

  it 'remembers entry and exit station' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.history).to include(journey)
  end

  it 'forgets the entry_station when touch_out is called' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.entry_station).to eq(nil)
  end

  it 'has an empty list of journeys by default' do
    expect(subject.history).to be_empty
  end

end
