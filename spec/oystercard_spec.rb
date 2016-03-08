require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}
  balance = described_class::MAX_BALANCE


  describe '#initialization' do
    it "expect #balance to be 0" do
      expect(oystercard.balance).to be_zero
    end

    it 'expects #in_journey? to be false' do
      expect(oystercard).not_to be_in_journey
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
      expect{ oystercard.top_up(balance + 1) }.to raise_error message
    end
  end

  describe '#deduct' do
    it 'changes the balance' do
      expect{ oystercard.deduct balance }.to change{ oystercard.balance }.by -balance
    end
  end

  describe '#touch_in' do
    it 'changes the state of #in_journey? to true' do
      expect { oystercard.touch_in }.to change { oystercard.in_journey? }.to true
    end
  end

  describe '#in_journey?' do
    it 'should never be nil' do
      expect(oystercard.in_journey?).to satisfy { |result| result == true || result == false }
    end
  end

  describe '#touch_out' do
    it 'should change state of in_journey to false' do
      oystercard.touch_in
      expect{oystercard.touch_out}.to change { oystercard.in_journey? }.to false
    end
  end

end
