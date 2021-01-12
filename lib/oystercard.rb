class Oystercard

LIMIT = 90

  def initialize
    @balance = 0
  end

  attr_reader :balance

  def top_up(amount)
    raise "That's too much money. You've exceeded your limit of £#{LIMIT}." if (@balance + amount) > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount 
  end
end
