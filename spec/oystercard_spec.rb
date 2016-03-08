require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  describe '#balance'do
    #it { is_expected.to respond_to(:balance) }
    #it { is_expected.to respond_to(:top_up).with(1).argument }


    it "expect balance to be 0" do
      expect(oystercard.balance).to be_zero
    end
  end

  describe '#top_up' do
    it 'can top up balance' do
      expect{ oystercard.top_up 5 }.to change{ oystercard.balance }.by 5
    end

    it 'fails if topup exceeds maximum balance' do
      balance = described_class::MAX_BALANCE
      message = "Top up exceeds the maximum balance of #{balance}"
      expect{ oystercard.top_up(balance + 1) }.to raise_error message
    end
  end

  describe '#deduct' do
    it 'changes the balance' do
      expect{ oystercard.deduct(5) }.to change{ oystercard.balance }.by -5
    end
  end
end
