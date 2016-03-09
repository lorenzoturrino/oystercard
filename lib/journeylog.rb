class Journeylog

  def initialize(journey_klass: )
    @journey_klass = journey_klass
  end

  def start_journey entry_station
    @journey_klass.new( entry_station: entry_station )
  end
end
