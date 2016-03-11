require 'journey'


describe Journey do

let(:aldgate) {double(:station)}
let(:kings_cross) {double(:station)}
let(:card) {double(:card, entrance: kings_cross, exit: aldgate)}


    xit 'should know the journey start' do
      expect(subject.start(card.entrance)).to eq kings_cross
    end

    xit 'should know the journey end' do
      expect(subject.end(card.exit)).to eq aldgate
    end

  describe 'Price' do
    xit 'should calculate a price for a journey' do
      expect(subject.fare).to eq 1
    end
  end
end
