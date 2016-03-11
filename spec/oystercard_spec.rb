require 'oystercard'

describe Oystercard do
  let(:journeylog_class) { double(:Journeylog_class, new: journeylog) }
  let(:journeylog) {double(:Journeylog, start: nil, finish: nil, fare: Journey::MIN_FARE) }
  subject(:card) { described_class.new(journeylog_class) }
  let(:entrance_stat) { double(:station) }
  let(:exit_stat) { double(:station) }

  describe 'Balance' do
    it 'starts with a balance of 0' do
      expect(card.check_balance).to eq Oystercard::DEFAULT_BALANCE
    end
  end

  describe 'Top-up' do
    it 'should return the value it was top-uped with' do
      expect(card.top_up(20)).to eq 20
    end

    it 'raises error for top-sum' do
      expect { card.top_up(91) }.to raise_error(RuntimeError)
    end

    it 'raises error for total balance' do
      card.top_up(80)
      expect { card.top_up(20) }.to raise_error(RuntimeError)
    end
  end

  describe 'touch in' do
    it 'should raise error if balance < MIN_FAIR' do
      expect { card.touch_in(entrance_stat) }.to raise_error(RuntimeError)
    end

    it 'passes touch in station to journey log' do
      card.top_up(80)
      expect(journeylog).to receive(:start).with(entrance_stat)
      card.touch_in(entrance_stat)
    end

    it 'should deduct fare from journey log' do
      card.top_up(80)
      expect { card.touch_in(entrance_stat) }.to change { card.check_balance }.by( -journeylog.fare )
    end
  end

  describe 'touch out' do
    it 'passes touch out station to journey log' do
      expect(journeylog).to receive(:finish).with(exit_stat)
      card.touch_out(exit_stat)
    end

    it 'should deduct fare from journey log' do
      expect { card.touch_out(exit_stat) }.to change { card.check_balance }.by( -journeylog.fare )
    end
  end
  #
  # describe 'Journey Hist.' do
  #   xit 'should be empty by default' do
  #     expect(card.history).to be_empty
  #   end
  #
  #   xit 'should create a journey' do
  #     card.top_up(10)
  #     card.touch_in(entrance_stat)
  #     card.touch_out(exit_stat)
  #     expect(card.history).to include(journey)
  #   end
  # end

  ######### TEST #LOG

end
