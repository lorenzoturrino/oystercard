require_relative 'journey'

class Oystercard

  attr_reader :balance, :history

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @history = []
    @min_fare = Journey::MIN_FARE
  end

  def top_up(amount)
    error_message = "Top up exceeds the maximum balance of #{MAX_BALANCE}"
    raise error_message if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    sufficent_funds?
    @entry_station = station
  end

  def in_journey?
    !!@entry_station
  end

  def touch_out(station)
    deduct @min_fare
    log_journey station
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def sufficent_funds?
    message = "Not enough funds"
    raise message if @balance < @min_fare
  end

  def log_journey station
    @history << { entry_station: @entry_station, exit_station: station }
  end
end
