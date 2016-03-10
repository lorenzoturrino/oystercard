require 'journey'

class JourneyLog

  attr_reader :current_journey

  def initialize(journey_class)
    @journey_class = journey_class
  end

  def start_new_journey(station)
    @current_journey = @journey_class.new(station)
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
