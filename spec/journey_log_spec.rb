require 'journey_log'
describe JourneyLog do

  subject(:journey_log) {described_class.new(journey_class)}
  let(:journey_class) {double :Journey, new: journey}
  let(:journey) {double :journey, end_trip: nil}
  let(:station) {double :station}

  describe '#start_new_journey' do
    xit 'creates a new journey instances' do
      expect(journey_class).to receive(:new).with(station)
      journey_log.start_new_journey(station)
    end

    xit 'stores new journey in current journey' do
      journey_log.start_new_journey(station)
      expect(journey_log.current_journey).to eq journey
    end

    xit 'complete the outstanding journey if there is one ongoing' do
      journey_log.start_new_journey station
      expect(journey_log).to receive(:close_current_journey)
      journey_log.start_new_journey station
    end

  end

  describe '#close_current_journey' do

  # before(:each) do
  #   journey_log.start_new_journey(station)
  # end

    xit 'store the completed journey in the log' do
      expect{journey_log.close_current_journey(station)}.to change{journey_log.journey_log.size}.by(1)
    end

    xit 'sets the current journey to nil' do
      journey_log.close_current_journey(station)
      expect(journey_log.current_journey).to eq nil
    end

    xit 'store the end station in the journey instance' do
      expect(journey).to receive(:end_trip).with(station)
      journey_log.close_current_journey(station)
    end

    it 'create the current journey when there is no starting station' do
      expect{journey_log.close_current_journey(station)}.to change {journey_log.journey_log.size}.by(1)
    end

  end


  describe '#outstanding_fares' do

    xit 'calls the #fare method on the last instance of journey' do
      journey_log.start_new_journey station
      journey_log.close_current_journey station
      expect(journey).to receive(:fare)
      journey_log.outstanding_fares
    end

  end


end
