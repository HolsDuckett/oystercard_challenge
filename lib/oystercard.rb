class Oystercard

LIMIT = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey = false
  end

  attr_reader :balance

  def top_up(amount)
    raise "That's too much money. You've exceeded your limit of £#{LIMIT}." if (@balance + amount) > LIMIT
    @balance += amount
  end

  def in_journey?
    @journey
  end

  def touch_in
    raise 'You have insuffiecient funds.' if @balance < MINIMUM_FARE
    @journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @journey = false
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end

end
