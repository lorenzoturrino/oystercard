class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} would be exceeded" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
