class Journey

  attr_reader :entry_station , :exit_station

  def initialize station_in , station_out
    @entry_station , @exit_station = station_in , station_out
  end

end
