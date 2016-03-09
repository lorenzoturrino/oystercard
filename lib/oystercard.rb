require_relative 'journey'

class Oystercard

  attr_reader :balance, :history

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @history = []
    @min_fare = Journey::MIN_FARE
    @entry_station = nil
  end

  def top_up(amount)
    error_message = "Top up exceeds the maximum balance of #{MAX_BALANCE}"
    raise error_message if balance + amount > MAX_BALANCE
    @balance += amount
  end


  def touch_in entry_station
    sufficent_funds?
    @entry_station = entry_station
  end

  def in_journey?
    !!@entry_station
  end


  def touch_out exit_station
    finish_journey exit_station
    @entry_station = nil
  end

  private

  def finish_journey exit_station #still a forge
    current_journey = Journey.new(entry_station: @entry_station , exit_station: exit_station)
    log_journey current_journey
    deduct current_journey.fare
  end

  def deduct(amount)
    @balance -= amount
  end

  def sufficent_funds?
    message = "Not enough funds"
    raise message if @balance < min_fare
  end

  def log_journey current_journey
    @history << current_journey
  end
end
