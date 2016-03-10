require 'oystercard'

describe Oystercard do

  subject(:oystercard){described_class.new}
  let(:journey_log) {double :journey_log, start: nil}
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

    it 'it aks the log to start a new journey' do
      oystercard.top_up(1)
      expect(journey_log).to receive(:start)
      oystercard.touch_in(station)
    end

    it 'raise an error if youe below minimum fare' do
      expect {oystercard.touch_in(station)}.to raise_error described_class::MIN_ERROR
    end

  end

  describe '#touch_out' do
    before (:each) do
      oystercard.top_up(1)
    end
  end

end
