require 'journey'

class JourneyLog

  attr_reader :current_journey, :past_journey_log

  def initialize(journey_class)
    @journey_class = journey_class
    @past_journey_log = Array.new
  end

  def start_new_journey(station)
    @current_journey = @journey_class.new(station)
  end

  def close_current_journey(station)
    @current_journey.add_exit_station(station)
    @past_journey_log << @current_journey
    @current_journey = nil
  end


end

#   attr_reader :journeys
#
#   def initialize(journey_class: Journey)
#     @journey_class = journey_class
#     @journeys = []
#   end
#
#   def start(station)
#     @journey.add_station(:entry_station => station)
#   end
#
#   def finish(station)
#     @journey.add_station(:exit_station => station)
#   end
#
#   def current_journey
#     @journey ||= @journey_class.new
#   end
#
#   def commit
#     @journeys << @journey
#     @journey = nil
#   end
#
#   private
#   def in_journey?
#     !@journey.nil?
#   end
#
# end
