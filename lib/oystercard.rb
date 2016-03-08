class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    error_message = "Top up exceeds the maximum balance of (#{MAX_BALANCE})"
    raise error_message if @balance + amount > MAX_BALANCE
    @balance += amount
  end

end
