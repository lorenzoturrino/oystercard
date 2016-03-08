require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:station_in) { double(:Station) }
  let(:station_out) { double(:Station) }
  balance = described_class::MAX_BALANCE
  min_fare = described_class::MIN_FARE

  describe '#initialization' do
    it "expect #balance to be 0" do
      expect(oystercard.balance).to be_zero
    end

    it 'expects #in_journey? to be false' do
      expect(oystercard).not_to be_in_journey
    end

    it 'expects #history to be empty' do
      expect(oystercard.history).to be_empty
    end
  end

  describe '#balance'do
    #it { is_expected.to respond_to(:balance) }
    #it { is_expected.to respond_to(:top_up).with(1).argument }

  end

  describe '#top_up' do
    it 'can top up balance' do
      expect{ oystercard.top_up balance }.to change{ oystercard.balance }.by balance
    end

    it 'fails if topup exceeds maximum balance' do
      message = "Top up exceeds the maximum balance of #{balance}"
      expect{ oystercard.top_up(balance + min_fare) }.to raise_error message
    end
  end

  describe '#touch_in' do

    it 'changes the state of #in_journey? to true' do
      oystercard.top_up(min_fare)
      expect { oystercard.touch_in station_in }.to change { oystercard.in_journey? }.to true
    end

    it 'raises an error if balance is not sufficent for single journey' do
      message = "Not enough funds"
      expect { oystercard.touch_in station_in }.to raise_error message
    end

    it 'remembers the entry station when touching in' do
      oystercard.top_up(min_fare)
      expect { oystercard.touch_in station_in }.to change { oystercard.entry_station }
    end
  end

  describe '#in_journey?' do
    it 'should never be nil' do
      expect(oystercard.in_journey?).to satisfy { |result| result == true || result == false }
    end
  end

  describe '#touch_out' do
    it 'should change entry_station to nil' do
      oystercard.top_up(min_fare)
      oystercard.touch_in station_in
      expect{ oystercard.touch_out station_out }.to change { oystercard.entry_station }.to nil
    end

    it 'changes the balance' do
      expect{ oystercard.touch_out station_out }.to change{ oystercard.balance }.by -min_fare
    end

    it 'logs journey history' do
      oystercard.top_up(min_fare)
      oystercard.touch_in station_in
      journey = { entry_station: station_in, exit_station: station_out }
      expect{ oystercard.touch_out station_out }.to change { oystercard.history }.to include journey
    end
  end

end
