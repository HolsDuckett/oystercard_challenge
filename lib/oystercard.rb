require_relative 'journey'

class Oystercard

  LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "That's too much money. You've exceeded your limit of £#{LIMIT}." if (@balance + amount) > LIMIT
    @balance += amount
  end

  def in_journey?
   !@entry_station.nil?
  end

  def touch_in(entry_station)
    raise 'You have insufficient funds.' if @balance < MINIMUM_FARE
    @entry_station = entry_station
    @journeys << {entry_station: entry_station, exit_station: nil}
    @journey = Journey.new(entry_station)
    puts "in oystercard.rb def touch_in, entry_station = #{entry_station}"
    entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @journeys[-1][:exit_station] = exit_station
    @journeys
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
