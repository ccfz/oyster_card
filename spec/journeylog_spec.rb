require 'journeylog'

describe Journeylog do

  let(:journey) { double(:Journey, start: nil) }
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

    it '' do

    end
  end

  describe '#finish' do
    it 'passes finish station to journey instance' do
      expect(journey).to receive(:end).with(station)
      journeylog.finish(station)
    end

  end

  describe '#journeys' do

  end

  describe '#fare' do
    it 'charges a fare' do

    end

    it 'charges a penalty if double touch in' do

    end

    it 'charges a penalty if double touch out' do

    end
  end

end
