require_relative 'journey'

class Oystercard

  attr_reader :balance, :history

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @history = []
  end

  def top_up(amount)
    error_message = "Top up exceeds the maximum balance of #{MAX_BALANCE}"
    raise error_message if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    log_journey if in_journey?
    sufficent_funds?
    @entry_station = station
  end

  def in_journey?
    !!@entry_station
  end

  def touch_out(station)
    deduct min_fare
    log_journey station
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def sufficent_funds?
    message = "Not enough funds"
    raise message if @balance < min_fare
  end

  def log_journey station=nil
    current_journey = Journey.new{entry_station: entry_station, exit_station: station}
    deduct current_journey.fare
    @history << current_journey
  end

  def min_fare
    Journey::MIN_FARE
  end
end
