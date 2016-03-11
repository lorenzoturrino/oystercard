require 'journey'

class JourneyLog

  attr_reader :current_journey, :journey_log

  def initialize(journey_class)
    @journey_class = journey_class
    @journey_log = Array.new
  end

  def start_new_journey(station=nil)
    close_current_journey unless @current_journey.nil?
    @current_journey = @journey_class.new(station)
  end

  def close_current_journey(station=nil)
    @current_journey = @journey_class.new if @current_journey.nil?
    @current_journey.end_trip(station)
    @journey_log << @current_journey
    @current_journey = nil
  end

  def outstanding_fares
    @journey_log.last.fare
  end

end
