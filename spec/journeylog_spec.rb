require 'journeylog'

describe Journeylog do

  let(:journey) { double(:Journey, start: nil, finish: nil, fare: Journey::MIN_FARE) }
  let(:journey_class) { double(:Journey_class, new: journey) }
  subject(:journeylog) { described_class.new(journey_klass: journey_class) }
  let(:station) { double(:Station) }

  it 'initializes with an empty history' do
    expect(journeylog.journeys).to be_empty
  end

  describe '#start' do
    it 'initializes a new journey if none exists' do
      expect(journey_class).to receive(:new)
      journeylog.start(station)
    end

    it 'passes start station to journey instance' do
      expect(journey).to receive(:start).with(station)
      journeylog.start(station)
    end

    it 'double touching calls on fare with penatly fare' do
      expect(journey).to receive(:fare)
      journeylog.start(station)
      journeylog.start(station)
    end

    it 'double touching safes a journey' do
      journeylog.start(station)
      journeylog.start(station)
      expect(journeylog.journeys).to include(journey)
    end

  end

  describe '#finish' do
    it 'passes finish station to journey instance' do
      expect(journey).to receive(:finish).with(station)
      journeylog.finish(station)
    end


  end

  describe '#journeys' do

    it 'it stores journeys' do
      journeylog.finish(station)
      expect(journeylog.journeys).to include(journey)
    end

  end

  describe '#fare' do
    it 'sets a fare' do
      journeylog.finish(station)
      expect(journeylog.fare).to eq (journey.fare)
    end

  end

end
# test how fare reset