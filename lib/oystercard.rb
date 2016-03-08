class Oystercard

  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
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
    !!entry_station
  end

  def touch_out
    deduct MIN_FARE
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def sufficent_funds?
    message = "Not enough funds"
    raise message if @balance < MIN_FARE
  end
end
