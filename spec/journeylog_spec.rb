require 'journeylog'

describe Journeylog do
  let(:journey) { double(:Journey) }
  let(:station) { double(:Station) }
  let(:journey_klass) { double(:JourneyKlass, new: journey) }
  subject(:journeylog) { described_class.new(journey_klass: journey_klass) }

  describe '#start_journey' do
    it 'starts a a new journey' do
      expect(journey_klass).to receive(:new).with(entry_station: station)
      journeylog.start_journey(station)
    end

    it 'should record a journey' do
      journeylog.start_journey(station)
      expect(journeylog.journeys).to include journey
    end
  end

  describe '#end_journey'
end
