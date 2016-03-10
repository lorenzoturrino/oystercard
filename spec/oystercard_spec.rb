require 'oystercard'

describe Oystercard do

  subject(:oystercard){described_class.new}
  let(:journey_log) {double :journey_log, start_new_journey: nil, close_current_journey: nil, outstanding_fares: nil}
  let(:station) {double :station}

  it "starts with default balance of £#{described_class::DEFAULT_BALANCE}" do
    expect(oystercard.balance).to eq described_class::DEFAULT_BALANCE
  end

  describe '#top_up' do

    it 'expect to add amount to card balance' do
      expect {oystercard.top_up(10)}.to change{oystercard.balance}.by 10
    end

    it "expects to raise error when max limit exceeded" do
      oystercard.top_up(described_class::MAX_LIMIT)
      expect{oystercard.top_up(1)}.to raise_error described_class::MAX_ERROR
    end
  end

  describe '#touch_in' do

    it 'it ask the log to start a new journey' do
      oystercard.top_up(1)
      expect(journey_log).to receive(:start_new_journey).with(station)
      oystercard.touch_in(station)
    end

    it 'raise an error if you\'re below minimum fare' do
      expect {oystercard.touch_in(station)}.to raise_error described_class::MIN_ERROR
    end

  end

  describe '#touch_out' do

    before (:each) do
      oystercard.top_up(1)
      oystercard.touch_in(station)
    end

    it 'it ask the log to close the current journey' do
      expect(journey_log).to receive(:close_current_journey).with(station)
      oystercard.touch_out(station)
    end

    it 'it ask for a fare to be returned' do
      expect(journey_log).to receive(:outstanding_fares)
      oystercard.touch_out
    end

  end

end
