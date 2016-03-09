class Journeylog

  attr_reader :journeys

  def initialize(journey_klass: )
    @journey_klass = journey_klass
    @journeys = []
  end

  def start_journey entry_station
    journeys << @journey_klass.new( entry_station: entry_station )
  end

  private

  def current_journey
    #todo: read journey instance status and decide what to return
  end

  def exit_journey
    #todo: complete a journey and store it
  end

  def outstanding_charges
    #bill all the missing charges
  end

end
