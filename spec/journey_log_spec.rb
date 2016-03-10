require 'journey_log'
describe JourneyLog do

  subject(:journey_log) {described_class.new(journey_class)}
  let(:journey_class) {double :Journey, new: journey}
  let(:journey) {double :journey, add_exit_station: nil}
  let(:station) {double :station}

  describe '#start_new_journey' do
    it 'creates a new journey instances' do
      expect(journey_class).to receive(:new).with(station)
      journey_log.start_new_journey(station)
    end

    it 'stores new journey in current journey' do
      journey_log.start_new_journey(station)
      expect(journey_log.current_journey).to eq journey
    end

  end

  describe '#close_current_journey' do

  before(:each) do
    journey_log.start_new_journey(station)
  end

    it 'store the completed journey in the log' do
      expect{journey_log.close_current_journey(station)}.to change{journey_log.past_journey_log.size}.by(1)
    end

    it 'sets the current journey to nil' do
      journey_log.close_current_journey(station)
      expect(journey_log.current_journey).to eq nil
    end

    it 'store the end station in the journey instance' do
      expect(journey).to receive(:add_exit_station).with(station)
      journey_log.close_current_journey(station)

    end

  end


end
  # let (:journey_class) {double :journey_class, new:journey_instance}
  # let(:journey_instance) { double :journey_instance, add_station: nil}
  # subject(:journeylog) {described_class.new(journey_class: journey_class)}
  #
  # let(:entry_station) { double :station }
  # let(:exit_station) { double :station }
  # let(:trip){{entry_station: entry_station, exit_station: exit_station}}
  #
  #
  # it{is_expected.to respond_to(:start)}
  # it{is_expected.to respond_to(:finish)}
  # it{is_expected.to respond_to(:current_journey)}
  # it{is_expected.to respond_to(:journeys)}
  #
  # describe '#current_journey' do
  #   it 'creates a new journey  object if no journey in progress' do
  #     expect(journeylog.current_journey).to eq journey_instance
  #   end
  #
  #   it 'returns current journey if journey in progress' do
  #     journeylog.current_journey
  #     expect(journeylog.current_journey).to eq journey_instance
  #   end
  # end
  #
  # it 'stores complete journey' do
  #   journeylog.current_journey
  #   journeylog.start(entry_station)
  #   journeylog.finish(exit_station)
  #   journeylog.commit
  #   expect(journeylog.journeys).to include journey_instance
  # end

  # describe '#start' do
  #   let(:trip){{entry_station: entry_station}}
  #   it 'stores entry station in @journey' do
  #     journeylog.current_journey
  #     allow(journey_instance).to receive(:trip).and_return(trip)
  #     journeylog.start(entry_station)
  #     expect(journeylog.current_journey.trip).to include trip
  #   end
  # end
  #
  # describe '#finish' do
  #   it 'stores exit station in @journey' do
  #     journeylog.current_journey
  #     journeylog.finish(exit_station)
  #     allow(journey_instance).to receive(:trip).and_return(exit_station)
  #     expect(journeylog.current_journey.trip).to eq exit_station
  #   end
  # end
