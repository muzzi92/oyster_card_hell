require 'journey'

describe Journey do
  let(:station) { double :station }

  describe '#start_journey' do
    it 'sets an entry station' do
      subject.start_journey(station)
      expect(subject.journey[:entry_station]).to eq(station)
    end
  end

  describe 'finish journey' do
    it 'sets an exit station' do
      subject.finish_journey(station)
      expect(subject.journey[:exit_station]).to eq(station)
    end
  end

  describe '#fare' do
    context 'if the journeys been finished' do
      before do
        subject.start_journey(station)
        subject.finish_journey(station)
      end
      it 'returns the fair' do
        expect(subject.fare).to eq(Journey::MIN_FARE)
      end
    end

    context 'if journey not started' do
      before { subject.finish_journey(station) }
      it 'returns PENALTY_FARE' do
        expect(subject.fare).to eq(Journey::PENALTY_FARE)
      end
    end
  end

  describe 'if  journey is complete' do
    context
  end


end
