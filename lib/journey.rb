class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station , :exit_station

  def initialize entry_station
    @entry_station = entry_station
  end

  def fare
    return 6 if penalty_due?
    1
  end

  def end_journey exit_station
    @exit_station = exit_station
  end

  private

  def penalty_due?
    entry_station.nil? || exit_station.nil?
  end


end
