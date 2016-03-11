class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :starting_station, :ending_station

  def initialize station = nil
    @starting_station = station
  end

  def end_trip station
    @ending_station = station
  end

  def fare
    return PENALTY_FARE if starting_station.nil? || ending_station.nil?
    MIN_FARE
  end
  # def add_station(station)
  #   trip.merge!(station)
  # end
  #
  # def fare
  #   trip.length == 2 ? MIN_FARE : PENALTY_FARE
  # end

end
