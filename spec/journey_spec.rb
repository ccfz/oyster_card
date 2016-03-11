require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:station) {double(:Station)}

  describe '#start' do
    it 'should set the journey start' do
      journey.start(station)
      expect(journey.entrance).to eq station
    end
  end

  describe '#finish' do
    it 'should know the journey end' do
      journey.finish(station)
      expect(journey.end_stat).to eq station
    end
  end

  describe '#fare' do
    it 'should calculate a price for complete journey' do
      journey.start(station)
      journey.finish(station)
      expect(subject.fare).to eq Journey::MIN_FARE
    end

    it 'should charge pen_fare for no-start-station journey' do
      journey.finish(station)
      expect(subject.fare).to eq Journey::PEN_FARE
    end

    it 'should charge pen_fare for no-finish-station journey' do
      journey.start(station)
      expect(subject.fare).to eq Journey::PEN_FARE
    end
  end
end
